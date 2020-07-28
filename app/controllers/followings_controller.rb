class FollowingsController < ApplicationController

  def create
    @following = Following.create(podcast_id: params[:podcast_id], user_id: params[:user_id])
  end
end
