class Suggestion < ApplicationRecord
  # Remember to create a migration!
  validates :title
  validates :details
  validates :user_id

  belongs_to :user
end
