class Suggestion < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :user, presence: true
  #validates :user_id, presence: true
end
