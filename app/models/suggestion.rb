class Suggestion < ApplicationRecord
  belongs_to :user
  # has_many :upvotes

  validates  :title,:body, presence: true
end
