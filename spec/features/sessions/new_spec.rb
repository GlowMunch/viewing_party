require "rails_helper"

RSpec.describe "New Session login" do
  it "starts a new session when I login" do
    user = User.create(username: 'user1', email: 'user1@test.com', password: 'password1', password_confirmation: 'password1')
    visit root_path
    click_on "I already have an account"
    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"



    expect(current_path).to eq(user_path(user.id))

    expect(page).to have_content("Welcome, #{user.username}")

  end
end
