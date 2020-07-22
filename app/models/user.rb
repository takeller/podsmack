class User < ApplicationRecord
  validates :password_digest, presence: true
  validates :user_name, presence: true
  has_many :followings
  has_many :podcasts, through: :followings
end
