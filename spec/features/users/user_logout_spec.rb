require "rails_helper"

RSpec.describe "user logout" do
  it "can logout" do
    user = User.create(username: "testertest", email: "my@email.com", password: "test")

    visit root_path
    click_on "I already have an account"
    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"
    expect(current_path).to eq(user_path(user.id))
    expect(page).to have_content("Welcome, #{user.username}")

    visit root_path

    expect(page).to_not have_link("Register as a User")
    expect(page).to_not have_link("I already have an account")

    expect(page).to have_button("Log Out")

    click_on "Log Out"
    expect(page).to have_content("You have been logged out.")

    expect(page).to_not have_button("Log Out")

  end
end