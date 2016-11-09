class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates :email, :name, presence: true
  validates :email, uniqueness: true
  has_many :orders, dependent: :destroy

  enum role: [:default, :admin]
end
