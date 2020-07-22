class ApplicationsController < ApplicationController

  def new
    @application = Application.new
  end
end
