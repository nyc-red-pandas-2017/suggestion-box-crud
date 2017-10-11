class User < ApplicationRecord
  has_many :suggestions

  # validates :username, :email, :password, presence: true
  validates :username, uniqueness: true


end


