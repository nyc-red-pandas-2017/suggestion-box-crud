class Vote < ApplicationRecord
  validates :vote, { presence: true }

  belongs_to :suggestion
  belongs_to :user
end
