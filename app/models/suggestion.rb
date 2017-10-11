class Suggestion < ApplicationRecord
  validates  :title,:body, presence: true
end
