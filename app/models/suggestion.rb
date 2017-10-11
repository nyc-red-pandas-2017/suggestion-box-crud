class Suggestion < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :user
end
