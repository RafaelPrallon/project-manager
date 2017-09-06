Rails.application.routes.draw do

  get "bugs/mark_as_solved", to: "bugs#marked_as_solved"
  resources :users
  resources :projects do
    resources :bugs do
      resources :comments
    end
  end
  resources :user_projects

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root 'home#index'
end
