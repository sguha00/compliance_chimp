require 'spec_helper'

feature 'Manage proofs' do
  given!(:user) {create(:user)}
  given!(:requirement1) {create(:requirement, name: "1.1.1")}
  given!(:requirement2) {create(:requirement, name: "1.1.2")}
  given!(:proof)        {create(:proof, user: user, requirement: requirement1)}

  # Given user is logged in
  background do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = {
      'uid'  => '100004721472441',
      'provider' => 'github',
      'info' => {
        'name' => 'Bob Raymond',
        'email' => 'bob@example.com'
      }
    }
    visit signin_path
  end

  describe "user browsing requirements and proofs" do
    # Then user expects to see all requirements
    scenario 'user expects to see all requirements' do
      expect(page).to have_css '[data-role="requirement"]', text: '1.1.1'
      expect(page).to have_css '[data-role="requirement"]', text: '1.1.2'
    end
    # Then user expects to see proofs he has submitted
    scenario 'user expects to see proofs he has submitted' do
      expect(page).to have_xpath "//img[@src='#{proof.image_url}']"
    end
  end

  describe "user wishing to fulfill requirements" do
    context "for requirements with no proof" do
      # When user adds a proof
      # Then user expects to see the proof image
      scenario 'adds a new proof image' do
        click_link 'Attach proof for 1.1.2'
        fill_in 'proof_image_url', with: 'http://www.imgur.com/1.1.2.png'
        click_button 'Submit'
        expect(page).to have_xpath '//img[@src="http://www.imgur.com/1.1.2.png"]'
      end
    end

    context "for requirements with existing proof" do
      # When user updates a proof
      # Then user expects to see the updated proof
      scenario "updates proof" do
        click_link 'Update proof for 1.1.1'
        fill_in 'proof_image_url', with: 'http://www.imgur.com/1.1.1-updated_today.png'
        click_button 'Submit'
        expect(page).to have_xpath '//img[@src="http://www.imgur.com/1.1.1-updated_today.png"]'
      end
      # Then user expects not to be able to add a new proof
      scenario "expects not to be able to add a new proof" do
        expect(page).not_to have_link "Attach proof for 1.1.1"
      end
    end
  end
end
