require 'spec_helper'

feature 'Manage proofs' do
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
  # Then user expects to see PCI requirements
  scenario 'user views all requirements' do
    (1..2).each do |n|
      create(:requirement, name: "1.1.#{n}")
    end
    visit signin_path
    expect(page).to have_css '[data-role="current-user"]', text: 'Bob Raymond'
    expect(page).to have_css '[data-role="requirement"]', text: '1.1.1'
    expect(page).to have_css '[data-role="requirement"]', text: '1.1.2'
  end

  # Given user is logged in and on users#show
  # When user adds a proof
  # Then user expects to see the proof image on users#show
  scenario 'user adds a new proof image' do
    create(:requirement, name: "1.1.1")
    visit signin_path
    click_link 'Attach proof'
    fill_in 'proof_image_url', with: 'http://www.imgur.com/1.1.1.png'
    click_button 'Submit'
    expect(page).to have_xpath '//img[@src="http://www.imgur.com/1.1.1.png"]'
  end
end
