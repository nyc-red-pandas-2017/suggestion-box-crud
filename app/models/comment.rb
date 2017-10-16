class Comment < ApplicationRecord
  # Remember to create a migration!
  validates :comment_text, :user, :suggestion, presence: true
  belongs_to :user
  belongs_to :suggestion
end
