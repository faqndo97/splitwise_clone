Rails.application.routes.draw do
  resources :groups
  resources :users

  # groups users
  get '/groups_users', to: 'groups_users#index'
  post '/groups_users', to: 'groups_users#create'
  delete '/groups_users', to: 'groups_users#destroy'
  # groups users
end
