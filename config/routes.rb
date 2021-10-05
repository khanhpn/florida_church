Rails.application.routes.draw do
  devise_for :users do
    get 'admin/login', to: 'devise/sessions#new'
    delete 'admin/logout', to: 'devise/sessions#destroy'
  end

  namespace :admin do
    get "dashboard", to: 'dashboard#index'
    resources :introduction
  end

  root to: "home#index"
end
