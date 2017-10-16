class Suggestion < ApplicationRecord
  # Remember to create a migration!
  validates :title, :description, :user, presence: true
  belongs_to :user
  has_many :comments


end
