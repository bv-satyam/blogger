class User < ApplicationRecord
	has_many :articles, dependent: :destroy
	has_secure_password
	validates :email, presence: true, uniqueness: true

	def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_digest)
      user
    else
      nil
    end
  end
end
