class ThumbUp < ApplicationRecord
  belongs_to :suggestion
  belongs_to :voter, class_name: :User
  validates :user_id, :suggestion_id, presence: true
end
