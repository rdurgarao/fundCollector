class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  def self.authenticate(email, password)
    user = self.find_by(email: email)

    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
