require "rails_helper"

# As a visitor
# When I visit `/register`
# I see a form to fill in my name, email, password, and password confirmation.
# When I fill in that form with my name, email, and matching passwords,
# I'm taken to my dashboard page `/users/:id`

RSpec.describe "User Registration Page" do
  describe "Register New User" do

    before :each do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @user3 = FactoryBot.create(:user)
      @user4 = FactoryBot.create(:user)
    end

    it "Form to create user" do

      visit root_path
      click_on "Register as a User"
      expect(current_path).to eq(new_register_path)

      username = "president_person"
      email = "user@email.com"
      password = "password"

      fill_in :user_username, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_on "Create User"
      expect(page).to have_content("Welcome, #{username}!")


    end

    it "needs password to match" do
      visit new_register_path

      username = "President_Person"
      email = "user@email.com"
      password = "password"
      password1 = "bad_password"

      fill_in :user_username, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password1

      click_on "Create User"

      expect(current_path).to eq(new_register_path)
      expect(page).to have_content("Sorry, credentials don't match")
    end

    it "needs username to be unique" do
      visit new_register_path

      username = "president_person"
      email = "user@email.com"
      password = "password"
      password1 = "bad_password"

      fill_in :user_username, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_on "Create User"

      visit new_register_path

      fill_in :user_username, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: password1
      fill_in :user_password_confirmation, with: password1

      click_on "Create User"

      expect(page).to have_content("Sorry, credentials don't match")

    end
  end


end