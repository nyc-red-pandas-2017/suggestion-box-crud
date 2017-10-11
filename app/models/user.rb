class User < ApplicationRecord
  # Remember to create a migration!
  has_many :suggestions
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password
end
