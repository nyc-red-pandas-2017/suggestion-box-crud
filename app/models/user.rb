class User < ApplicationRecord
  has_many :suggestions

  validates :username,:hash_password, presence: true
  validates :username, uniqueness: true
  validates :hash_password, length: {minimum: 6}

  def password
    @password ||= BCrypt::Password.new(hash_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hash_password = @password
  end

  def self.authenticate(username, plaintext_password)
    return nil unless user = find_by(username: username)
    return user if user.password == plaintext_password
    return nil
  end
end
