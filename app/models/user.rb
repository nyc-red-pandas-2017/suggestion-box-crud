class User < ApplicationRecord
validates :username,:password, presence: true
validates :username, uniqueness: true
validates :password, length: {minimum: 6}

has_many :suggestions

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
