class User < ApplicationRecord
  has_many :suggestions
  validates :username, :password,  presence: true
  validates :password, length: {minimum: 6}
  validates :username, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, text_password)
    return nil unless user = find_by(username: username)
    return user if user.password == text_password
    return nil
  end

end
