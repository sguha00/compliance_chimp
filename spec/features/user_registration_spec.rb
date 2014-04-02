require 'spec_helper'

feature 'User registration' do
  given(:user)                  {create(:user)}
  given(:user_with_blank_email) {create(:user, email: "")}

  describe "with a github user with email filled in" do
    background do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = {
        'uid'  => user.uid,
        'provider' => user.provider,
        'info' => {
          'nickname' => user.name,
          'email' => user.email
        }
      }
      visit signin_path
    end

    scenario 'user is automatically registered and signed in' do
      expect(page).to have_content "Signed in!"
    end
  end

  describe "with a github user with a blank public email" do
    background do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:github] = {
        'uid'  => user_with_blank_email.uid,
        'provider' => user_with_blank_email.provider,
        'info' => {
          'nickname' => user_with_blank_email.name,
          'email' => user_with_blank_email.email
        }
      }
      visit signin_path
    end
    scenario "user is invited to fill in his email address" do
      expect(page).to have_content "Please enter your email address."
    end
    scenario "user completes registration and is redirected to requirements#index" do
      fill_in "user_email", with: "bob@example.com"
      click_button "Update"
      expect(page).to have_content "Your profile has been successfully updated!"
      expect(page).to have_content user_with_blank_email.name
      expect(page.current_path).to eq(requirements_path)
    end
  end
end
