require "rails_helper"

RSpec.describe User do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
    it { should validate_presence_of(:password_digest)}
    it { should have_secure_password}

    it "has a secure password" do
      user = User.create(username: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end


  end

  describe "relationships" do
    it { should have_many :viewing_users }
    it { should have_many(:viewing_parties).through(:viewing_users) }
  end
end

