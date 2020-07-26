Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/auth/failure', to:redirect('/')
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  root 'welcome#index'
  resources :users, only: [:new, :create] do
    resources :podcasts, only: [:new, :create]
  end
  resources :followings, only: [:create]

  resources :podcasts, only: [:index, :show]

  post '/approve_podcast/:id', to: 'approvals#update'

  get '/dashboard', to: 'users#show'


  resources :producers, only: [:show]

end
