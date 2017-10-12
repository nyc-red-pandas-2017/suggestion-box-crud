class ThumbsUp < ApplicationRecord
  belongs_to :suggestion
  belongs_to :voter, class_name: :User
  validates :voter_id, :suggestion_id, presence: true
end



















