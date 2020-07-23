class ApplicationsController < ApplicationController

  def new
    @application = Application.new
  end

  def create
    user = User.find(params[:user_id])
    application = user.applications.new(application_params)

    if application.save
      flash[:notice] = 'Application submitted and waiting approval'
      redirect_to '/dashboard'
    else
      flash[:notice] = 'Submission Failed'
      render :new
    end
  end

  private

  def application_params
    params.require(:application).permit(:podcast_name, :location, :description, :patreon, :instagram, :facebook, :twitter, :spotify_uri, :photo, :adult_content, :tags => [])
  end
end
