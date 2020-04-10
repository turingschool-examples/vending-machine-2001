Rails.application.routes.draw do
  root to: "owners#index"

  resources :owners do
    resources :machines, only: [:index]
  end

  resources :machines, only: [:show]
end


# Prefix Verb   URI Pattern                          Controller#Action
# root GET    /                                    owners#index
# owner_machines GET    /owners/:owner_id/machines machines#index
# owners GET    /owners                           owners#index
#      POST   /owners                             owners#create
# new_owner GET    /owners/new                    owners#new
# edit_owner GET    /owners/:id/edit              owners#edit
# owner GET    /owners/:id                        owners#show
#      PATCH  /owners/:id                         owners#update
#      PUT    /owners/:id                         owners#update
#      DELETE /owners/:id                         owners#destroy
# machine GET    /machines/:id                    machines#show
