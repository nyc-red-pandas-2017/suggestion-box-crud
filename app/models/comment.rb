class Comment < ApplicationRecord
  validates :text, { presence: true }
  validates :user, { presence: true }

  belongs_to :suggestion
  belongs_to :user
end
