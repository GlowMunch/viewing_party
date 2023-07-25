require 'rails_helper'

RSpec.describe 'landing page' do
  describe 'root path landing page' do
    before :each do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @user3 = FactoryBot.create(:user)
      @user4 = FactoryBot.create(:user)

      visit "/"

    end


    it 'application title' do
      within "#title" do
        expect(page).to have_content("Welcome to Movie Viewing Party!")
      end
    end

    it 'create new user button' do
      within "#users" do
        expect(page).to have_link "Register as a User"
      end
    end
  end
end