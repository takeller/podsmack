class PodcastsController < ApplicationController

  def index
    if params[:tags].present?
      @podcasts = Podcast.joins(:tags).where(tags: {id: params[:tags][:ids]})
    else
      @podcasts = Podcast.where(nil)
    end
    @podcasts = @podcasts.filter_by_location(params[:location])if params[:location].present?
  end

  def new
    @podcast = Podcast.new
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

  #TODO make more restful - could be update OR Seperate controller for ApprovalController
  def approve_podcast
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

  private

  def podcast_params
    params.require(:podcast).permit(:name, :location, :description, :patreon, :instagram, :facebook, :twitter, :spotify_uri, :photo, :adult_content)
  end
end
