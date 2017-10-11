class Thumbsup < ApplicationRecord
  # Remember to create a migration!
  validates :vote
  belongs_to :user

end
