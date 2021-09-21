Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    get "dashboard", to: 'dashboard#index'
  end

  root to: "home#index"
end
