class User < ApplicationRecord
  validates_presence_of :password, require: true, on: :create
  validates_confirmation_of :password
  has_secure_password
  validates :user_name, presence: true
  validates :user_name, uniqueness: true, presence: true
  has_many :followings
  has_many :podcasts, through: :followings
  has_many :applications
end
