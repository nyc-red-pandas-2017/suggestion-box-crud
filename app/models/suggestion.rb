class Suggestion < ApplicationRecord
  validates :title, { presence: true }
  validates :description, { presence: true }
  validates :user, { presence: true }

  belongs_to :user
  has_many :votes

  def vote_total
    upvotes = votes.count(true)
    downvotes = votes.count(false)
    return upvote_total - downvote_total
  end

end
