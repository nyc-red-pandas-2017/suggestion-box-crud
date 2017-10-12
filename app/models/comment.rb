class Comment < ApplicationRecord
  validates :text, { presence: true }

  belongs_to :suggestion
  belongs_to :user
end
