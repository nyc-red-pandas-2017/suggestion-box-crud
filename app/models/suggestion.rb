class Suggestion < ApplicationRecord
  belongs_to :user
  has_many :thumbs_up
  validates :title , :description , presence: true

  def points
    thumbs_up.sum(:value)
  end

end
