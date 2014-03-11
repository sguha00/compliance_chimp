require 'spec_helper'

# Given guest is on the homepage
# Then guest should see PCI Requirements
feature 'View the homepage' do
  scenario 'guest sees requirements' do
    (1..2).each do |n|
      create(:requirement, name: "1.1.#{n}")
    end
    visit root_path
    expect(page).to have_css '[data-role="requirement"]', text: '1.1.1'
    expect(page).to have_css '[data-role="requirement"]', text: '1.1.2'
  end
end
