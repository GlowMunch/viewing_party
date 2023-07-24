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

    it "Sees form for a new user" do

      visit root_path
      click_on "Create New User"
      expect(current_path).to eq(new_register_path)

      username = "President_Person"
      email = "user@email.com"
      password = "password"

      fill_in :user_username, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_on "Create User"

      expect(page).to have_content("Welcome, #{username}!")
      save_and_open_page

    end
  end


end