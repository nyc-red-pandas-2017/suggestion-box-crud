class Suggestion < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :description, :user, :thumbs_up, presence: true
end
