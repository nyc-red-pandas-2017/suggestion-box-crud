class Suggestion < ApplicationRecord
  belongs_to :author , class_name: :User
  has_many :votes , class_name: :ThumbsUp, foreign_key: :suggestion_id
  has_many :voters , through: :votes, class_name: :User
  validates :title , :description , :author_id, presence: true

  def points
    votes.sum(:value)
  end

end















