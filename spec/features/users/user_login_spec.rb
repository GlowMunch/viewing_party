require "rails_helper"

RSpec.describe "existing user login" do
  it "can login with valid credentials" do
    user = User.create(username: "testertest", email: "my@email.com", password: "test")

    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user.id))

    expect(page).to have_content("Welcome, #{user.username}")
  end
  it "sad path - rejected with invalid credentials" do
    user = User.create(username: "testertest", email: "my@email.com", password: "test")

    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :username, with: "badname"
    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Invalid Cridentials")
  end


end