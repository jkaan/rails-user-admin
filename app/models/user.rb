require 'bcrypt'

class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3 }
  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.password = BCrypt::Password.create(password)
    end
  end
end
