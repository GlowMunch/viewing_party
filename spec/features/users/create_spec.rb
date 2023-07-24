require "rails_helper"

# As a visitor
# When I visit `/register`
# I see a form to fill in my name, email, password, and password confirmation.
# When I fill in that form with my name, email, and matching passwords,
# I'm taken to my dashboard page `/users/:id`

RSpec.describe "User Registration Page" do
  describe "Register new User" do
    it "Sees form for a new user" do
      visit "/register"
      save_and_open_page
      click_button "Register as a User"

      expect(current_path).to eq(new_user_path)
      # expect(current_path).to eq users_register_index_path

      name = "President Person"
      email = "user@email.com"
      password = "password"

      fill_in :name, with: name
      fill_in :email, with: email
      fill_in :password, with: password

      click_on "Create User"

      user = User.last
      expect(current_path).to eq user_path(user.id)
    end
  end


end