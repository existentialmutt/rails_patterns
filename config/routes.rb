Rails.application.routes.draw do

  root 'user_signups#new'

  resources :user_signups, only: [:new, :create]
  resources :user_profiles, only: [:show, :edit, :update]

end
