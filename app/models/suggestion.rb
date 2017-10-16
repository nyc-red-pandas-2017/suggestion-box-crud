class Suggestion < ApplicationRecord
  belongs_to :user
  has_many :votes

  validates :title, :description, presence: true

  def points
    votes.sum(:value)
  end
end
