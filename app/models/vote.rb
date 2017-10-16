class Vote < ApplicationRecord
  validates :vote, presence: true

  belongs_to :votable, polymorphic: true
end


# <a href="/suggestions/<%= suggestion.id %>">
# </a>
