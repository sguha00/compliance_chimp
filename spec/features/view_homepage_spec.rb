require 'spec_helper'

# Given guest is on the homepage
# Then guest should see PCI Requirements
feature 'Guest views ' do
  scenario 'homepage and expects to see marketing copy' do
    visit root_path
    expect(page).to have_content 'Compliance chimp'
  end

  scenario 'about page expects to see about copy' do
    visit page_path('about')
    expect(page).to have_content 'Akshat Pradhan'
  end

  scenario 'faq page expects to see faq copy' do
    visit page_path('faq')
    expect(page).to have_content 'FAQ'
  end

  scenario 'find a qsa page expects to see find a qsa copy' do
    visit page_path('find-a-qsa')
    expect(page).to have_content 'Find a QSA!'
  end
end
