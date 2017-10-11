class Suggestion < ApplicationRecord
  validates :title, { presence: true }
  validates :description, { presence: true }
  validates :user, { presence: true }

  belongs_to :user
end
