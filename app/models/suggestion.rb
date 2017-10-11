class Suggestion < ApplicationRecord
  validates :title , :description , presence: true
end
