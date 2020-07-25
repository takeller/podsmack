class User < ApplicationRecord
  # validates_presence_of :password, require: true, on: :create
  # validates_confirmation_of :password
  # has_secure_password
  validates :user_name, presence: true
  validates :user_name, uniqueness: true, presence: true
  has_many :followings
  has_many :podcasts
  has_many :favorite_podcasts, through: :followings
  has_many :applications

  def self.from_omniauth(params)
    user = find_or_create_by(uid: params[:uid])
    user.user_name = params[:info][:name]
    user.email = params[:info][:email]
    user.save!
    user
  end
end
