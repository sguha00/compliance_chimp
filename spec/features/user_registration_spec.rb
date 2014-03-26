require 'spec_helper'

feature 'User registration' do
  given(:user)         {create(:user)}
  given(:unnamed_user) {create(:user, name: "")}

  describe "with a github user with name filled in" do
    background do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = {
        'uid'  => user.uid,
        'provider' => user.provider,
        'info' => {
          'name' => user.name,
          'email' => user.email
        }
      }
      visit signin_path
    end

    scenario 'user is automatically registered and signed in' do
      expect(page).to have_content "Signed in!"
    end
  end

  describe "with an unnamed github user" do
    background do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = {
        'uid'  => unnamed_user.uid,
        'provider' => unnamed_user.provider,
        'info' => {
          'name' => unnamed_user.name,
          'email' => unnamed_user.email
        }
      }
      visit signin_path
    end
    scenario "user is invited to fill in his name" do
      expect(page).to have_content "Please enter your name."
    end
    scenario "user fills in his name and completes registration" do
      fill_in "user_name", with: "Lename"
      click_button "Update"
      expect(page).to have_content "Your profile has been successfully updated!"
      expect(page).to have_content "Lename"
    end
  end
end
