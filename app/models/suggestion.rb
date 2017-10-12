class Suggestion < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :user
  has_many :votes, as: :votable

  def vote_sum
    total = 0
    votes.each do |vote|
      total += vote.vote
    end
    return total
  end
end
