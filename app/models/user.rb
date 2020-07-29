class User < ApplicationRecord
  validates :user_name, presence: true
  validates :uid, uniqueness: true, presence: true
  has_many :followings
  has_many :podcasts
  has_many :following_podcasts, through: :followings, source: :podcast
  has_many :applications
  
  def pending_podcasts
    Podcast.where(active: false)
  end

  def self.from_omniauth(params)
    user = find_or_create_by(uid: params[:uid])
    user.user_name = params[:info][:name]
    user.email = params[:info][:email]
    user.save!
    user
  end
end

