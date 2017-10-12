class User < ApplicationRecord
  has_many :suggestions
  has_many :up_votes
  has_many :up_voted_suggestions, through: :up_votes, source: :suggestion
  has_many :supports, through: :up_voted_suggestions, source: :user
  has_many :suggestions_up_voted, through: :suggestions, source: :up_votes
  has_many :supporters, through: :suggestions_up_voted, source: :user

  validates :username,:password, presence: true
  validates :username, uniqueness: true
  validates :password, length: {minimum: 6}

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = new_password
    self.password_hash = BCrypt::Password.create(new_password)
  end

  def self.authenticate(username, plaintext_password)
    return nil unless user = find_by(username: username)
    return user if user.password == plaintext_password
    return nil
  end
end
