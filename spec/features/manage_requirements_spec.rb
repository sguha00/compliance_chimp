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

  # Then user expects to see requirements and proofs
  scenario 'user views all requirements and proofs' do
    expect(page).to have_css '[data-role="current-user"]', text: user.name
    expect(find("#1-1-1-image")['src']).to include(proof.filepicker_url)
    expect(page).to have_css '[data-role="requirement"]', text: '1.1.1'
    expect(page).to have_css '[data-role="requirement"]', text: '1.1.2'
  end

  # Then user expects to see a requirements fulfilling status pie chart
  scenario 'user expects to see a requirements fulfilling status pie chart', js: true do
    expect(page).to have_css '[data-highcharts-chart]'
  end

  context "for requirements with no proof" do
    # When user adds a proof
    # Then user expects to see the proof image
    scenario 'user adds a new proof image' do
      pending "implement fake filepicker service first"
      click_link 'Attach proof for 1.1.2'
      fill_in 'proof_image_url', with: 'http://www.imgur.com/1.1.2.png'
      click_button 'Submit'
      expect(page).to have_xpath '//img[@src="http://www.imgur.com/1.1.2.png"]'
    end
  end

  context "for requirements with existing proof" do
    # When user updates a proof
    # Then user expects to see the updated proof
    scenario "user updates proof" do
      pending "implement fake filepicker service first"
      click_link 'Update proof for 1.1.1'
      fill_in 'proof_image_url', with: 'http://www.imgur.com/1.1.1-updated_today.png'
      click_button 'Submit'
      expect(page).to have_xpath '//img[@src="http://www.imgur.com/1.1.1-updated_today.png"]'
    end
    scenario "user expects to see current image in proof form" do
      expect(find("#1-1-1-image")['src']).to include(proof.filepicker_url)
    end
    scenario "user expects to not see an 'Attach proof' link" do
      expect(page).not_to have_link "Attach proof for 1.1.1"
    end
  end
end
