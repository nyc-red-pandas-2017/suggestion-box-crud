class User < ApplicationRecord
  has_many :created_suggestions, class_name: :Suggestion, foreign_key: :author_id
  has_many :thumbups , class_name: :ThumbsUp, foreign_key: :voter_id
  has_many :voted_suggestions, through: :thumbups, source: :suggestion
  has_many :votes , through: :created_suggestions
  has_many :supported_suggestions, through: :votes, source: :voter
  has_many :supports_suggestions , through: :voted_suggestions, source: :author

  validates :first_name,:last_name,:username,:email,:password,presence:true
  validates :email,:username, uniqueness: true
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





