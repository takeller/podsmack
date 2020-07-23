Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failutre', to:redirect('/')
  
  resources :users, only: [:new, :create]
  get '/dashboard', to: 'users#show'

  resources :producers, only: [:show]
end
