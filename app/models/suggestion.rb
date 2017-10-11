class Suggestion < ApplicationRecord
  # Remember to create a migration!
  validates :title, presence: true
  validates :details, presence: true

end
