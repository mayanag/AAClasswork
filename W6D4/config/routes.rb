Rails.application.routes.draw do
  get 'artwork_shares/create'
  get 'artwork_shares/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create, :show, :update, :destroy] do
    resources :artworks, only: [:index]
  end
  resources :artworks, except: [:index]
  resources :artwork_shares, only: [:create, :destroy]


  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new'
  # get '/users/:id/edit', to: 'users#edit'
  # get '/users/:id', to: 'users#show', as: 'fakeemail'
  # patch '/users/:id', to: 'users#update', as: 'update_user'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  
end
