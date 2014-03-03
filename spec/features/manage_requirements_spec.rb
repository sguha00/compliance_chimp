require 'spec_helper'

feature 'Manage requirements' do
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
  # Then user should see PCI Standards
  scenario 'user views all standards' do
    (1..2).each do |n|
      create(:standard, name: "1.1.#{n}")
    end
    visit signin_path
    expect(page).to have_css '[data-role="standard"]', text: '1.1.1'
    expect(page).to have_css '[data-role="standard"]', text: '1.1.2'
  end
end
