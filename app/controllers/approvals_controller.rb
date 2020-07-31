class ApprovalsController < ApplicationController

  def update
    podcast = Podcast.find(params[:id])
    podcast.update(active: true) 
    if podcast.save
      redirect_to dashboard_path
      flash[:success] = 'Application approved'
    else
      flash[:error] = podcast.errors.full_messages.to_sentence
      redirect_to dashboard_path
    end
  end
end