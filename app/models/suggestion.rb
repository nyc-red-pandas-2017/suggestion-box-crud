class Suggestion < ApplicationRecord
  belongs_to :user
  has_many :votes

  def points
    votes.sum(:value)
  end
end
