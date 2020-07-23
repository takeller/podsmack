Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failutre', to:redirect('/')

  root 'welcome#index'
  resources :users, only: [:new, :create] do
    resources :applications, only: [:new, :create]
  end 
  get '/dashboard', to: 'users#show'

  resources :producers, only: [:show]

end
