class Suggestion < ApplicationRecord
  # Remember to create a migration!
  validates :title, presence: true
  validates :details, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
