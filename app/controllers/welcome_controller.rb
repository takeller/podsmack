class WelcomeController<ApplicationController

  def index 
    @featured_podcasts = Podcast.order('RANDOM()').limit(3)
  end

end