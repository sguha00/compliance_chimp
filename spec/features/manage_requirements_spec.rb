require 'spec_helper'

feature 'Manage proofs' do
  given!(:user) {create(:user)}
  given!(:requirement1) {create(:requirement, name: "1.1.1")}
  given!(:requirement2) {create(:requirement, name: "1.1.2")}

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
  end

  # Given user is logged in
  # Then user expects to see requirements and proofs
  scenario 'user views all requirements and proofs' do
    proof = create(:proof, user: user, requirement: requirement1)
    visit signin_path
    expect(page).to have_css '[data-role="current-user"]', text: user.name
    expect(page).to have_xpath "//img[@src='#{proof.image_url}']"
    expect(page).to have_css '[data-role="requirement"]', text: '1.1.1'
    expect(page).to have_css '[data-role="requirement"]', text: '1.1.2'
  end

  # Given user is logged in and on users#show
  # When user adds a proof
  # Then user expects to see the proof image on users#show
  scenario 'user adds a new proof image' do
    visit signin_path
    within '[data-role="1.1.1-proof"]' do
      click_link 'Attach proof'
    end
    fill_in 'proof_image_url', with: 'http://www.imgur.com/1.1.1.png'
    click_button 'Submit'
    expect(page).to have_xpath '//img[@src="http://www.imgur.com/1.1.1.png"]'
  end
end
