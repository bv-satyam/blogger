class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  # has_secure_password
  # validates :email, presence: true, uniqueness: true

  # def self.authenticate(email, password)
  #   user = find_by_email(email)
  #   if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_digest)
  #     user
  #   else
  #     nil
  #   end
  # end
end
