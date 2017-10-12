class User < ApplicationRecord
  validates :username, { presence: true, uniqueness: true }
  validates :password_hash, { presence: true }

  has_many :suggestions
  has_many :votes

  def password
    @password ||=BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, new_password)
    user = User.find_by(username: username)
    if user && user.password == new_password
      return user
    else
      return nil
    end
  end

end
