Rails.application.routes.draw do

  get 'user_projects/index'

  get 'user_projects/show'

  get 'user_projects/new'

  get 'user_projects/edit'

  get 'user_projects/create'

  get 'user_projects/update'

  get 'user_projects/destroy'

#  get 'user/my_projects'

  resources :users, only: [:show]
  resources :projects

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
