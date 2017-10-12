class User < ApplicationRecord
  # Remember to create a migration!
  #validates :name, allow_blank: true
  has_many :suggestions
end
