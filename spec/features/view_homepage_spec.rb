require 'spec_helper'

# Given guest is on the homepage
# Then guest should see PCI Requirements
feature 'View the homepage' do
  scenario 'guest expects to see marketing copy' do
    visit root_path
    expect(page).to have_content 'Compliance chimp'
  end
end
