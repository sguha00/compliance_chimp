require 'spec_helper'

# Given guest is on the homepage
# Then guest should see PCI Standards
feature 'View the homepage' do
  scenario 'guest sees standards' do
    (1..2).each do |n|
      create(:standard, name: "1.1.#{n}")
    end
    visit root_path
    expect(page).to have_css '[data-role="standard"]', text: '1.1.1'
    expect(page).to have_css '[data-role="standard"]', text: '1.1.2'
  end
end
