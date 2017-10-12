class Suggestion < ApplicationRecord
  belongs_to :user
  has_many :up_votes

  validates  :title,:body, presence: true
end
