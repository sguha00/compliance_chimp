require 'spec_helper'

# Given user is on /standards
# Then user should see PCI Standards
feature 'View the PCI Standards' do
  scenario 'user sees requirements' do
    2.times do
      create(:standard)
    end
    visit standards_path
    expect(page).to have_css 'div', text: '1.1.1'
    expect(page).to have_css '[data-role="requirement"]', text: '1.1.2'
  end
end
