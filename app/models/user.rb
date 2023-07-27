class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email,
                        :username,
                        :password_digest

  validates :email, uniqueness: true
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true


  has_many :viewing_users
  has_many :viewing_parties, through: :viewing_users

  enum role: %w(default manager admin)
end
