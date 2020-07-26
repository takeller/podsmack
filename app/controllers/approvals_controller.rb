class ApprovalsController < ApplicationController

  def update
    podcast = Podcast.find(params[:id])
    podcast.update(active: true) 
    if podcast.save
      redirect_to '/dashboard'
      flash[:success] = 'Application approved'
    else
      flash[:error] = podcast.errors.full_messages.to_sentence
      redirect_to new_user_podcast_path(user)
    end
  end
end