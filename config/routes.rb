Rails.application.routes.draw do
  root 'home#index'

  get '/auth/github/callback', to: 'sessions#create'

  resources :dashboard, only: [:index]

  get '/repositories', to: 'repo#index'

  delete '/logout', to: 'sessions#destroy'
end
