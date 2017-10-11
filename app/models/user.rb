class User < ApplicationRecord
  # Remember to create a migration!
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password , presence: true
end
