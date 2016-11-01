class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates :email, :name, :password, :password_confirmation, presence: :true 
end
