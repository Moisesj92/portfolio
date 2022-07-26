Rails.application.routes.draw do
  resources :projects
  resources :posts
  devise_for :users

  root "home#index"

end
