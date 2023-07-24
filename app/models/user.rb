class User < ApplicationRecord
  validates_presence_of :email,
                        :username,
                        :password_digest

  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates_presence_of :password_digest

  has_secure_password

  has_many :viewing_users
  has_many :viewing_parties, through: :viewing_users
end
