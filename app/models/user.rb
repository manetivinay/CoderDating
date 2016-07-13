class User < ApplicationRecord
  validates :name, :password, :email, presence: true

  has_secure_password
end
