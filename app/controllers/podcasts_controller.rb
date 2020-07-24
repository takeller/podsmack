class PodcastsController < ApplicationController

  def new
    @podcast = Podcast.new
  end

  def create
    user = User.find(params[:user_id])
    
    podcast = user.podcasts.new(podcast_params)
    binding.pry
    if podcast.save
      flash[:notice] = 'Podcast submitted and waiting approval'
      redirect_to '/dashboard'
    else
      flash[:error] = podcast.errors.full_messages.to_sentence
      redirect_to new_user_podcast_path(user)
    end
  end

  private

  def podcast_params
    params.require(:podcast).permit(:name, :location, :description, :patreon, :instagram, :facebook, :twitter, :spotify_uri, :photo, :adult_content, :tags => [])
  end
end
