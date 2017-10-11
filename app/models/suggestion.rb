class Suggestion < ApplicationRecord
  validates :title, { presence: true }
  validates :description, { presence: true }
  validates :user, { presence: true }

  belongs_to :user
  has_many :votes

  def upvote_total
    return votes.count(true)
  end

  def downvote_total
    return votes.count(false)
  end

  def vote_total
    return upvote_total - downvote_total
  end

end
