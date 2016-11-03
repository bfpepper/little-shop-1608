class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates :email, :name, presence: true
  has_many :orders

  enum role: [:default, :admin]
end
