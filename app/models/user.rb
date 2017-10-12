class User < ApplicationRecord
  include BCrypt

  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_many :suggestions
  has_many :votes, as: :votable

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      return user
    else
      nil
    end
  end


#IuliaSwagTutorial
  # def authenticate(user_password)
  #   self.password == user_password
  # end


end
