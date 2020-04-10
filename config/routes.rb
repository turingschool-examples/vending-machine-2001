Rails.application.routes.draw do
  root to: "owners#index"

  get '/snacks/:id', to: 'snacks#show'

  resources :owners do
    resources :machines, only: [:index]
  end

  resources :machines, only: [:show]
end
