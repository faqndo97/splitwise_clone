Rails.application.routes.draw do
  resources :expenses
  resources :groups
  resources :users

  # groups users
  get '/groups_users', to: 'groups_users#index'
  post '/groups_users', to: 'groups_users#create'
  delete '/groups_users', to: 'groups_users#destroy'
  # groups users

 # deptos expenses
  get '/deptors_expenses', to: 'deptors_expenses#index'
  post '/deptors_expenses', to: 'deptors_expenses#create'
  delete '/deptors_expenses', to: 'deptors_expenses#destroy'
  # deptors expenses
end
