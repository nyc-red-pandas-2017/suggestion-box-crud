class User < ApplicationRecord
  include BCrypt
  has_many :comments

  has_many :suggestions

  validates :username, :email, :password, presence: true
  validates :username, uniqueness: true


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(plaintext_password)
    @password = BCrypt::Password.create(plaintext_password)
    self.password_hash = @password
  end

  def self.authenticate(username, plaintext_password)
    user = find_by(username: username)
    if user && user.password == plaintext_password
      return user
    else
      nil
    end
  end

end


