class PodcastsController < ApplicationController

  def new
    @podcast = Podcast.new
  end

  def show
    podcast = Podcast.find(params[:id])
    @podcast_facade = PodcastFacade.new(podcast)
  end

  def create
    user = User.find(params[:user_id])

    podcast = user.podcasts.new(podcast_params)
    if podcast.save
      params[:podcast][:tags].each {|tag| PodcastTag.create({podcast_id: podcast.id, tag_id: tag})}
      flash[:notice] = 'Podcast submitted and waiting approval'
      redirect_to '/dashboard'
    else
      flash[:error] = podcast.errors.full_messages.to_sentence
      redirect_to new_user_podcast_path(user)
    end
  end

  private

  def podcast_params
    params.require(:podcast).permit(:name, :location, :description, :patreon, :instagram, :facebook, :twitter, :spotify_uri, :photo, :adult_content)
  end
end
