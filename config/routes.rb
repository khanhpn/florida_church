Rails.application.routes.draw do
  devise_for :users do
    get 'admin/login', to: 'devise/sessions#new'
    delete 'admin/logout', to: 'devise/sessions#destroy'
  end

  namespace :admin do
    get "dashboard", to: 'dashboard#index'
    resources :introduction, except: :show
    resources :mass
    resources :users
    resources :logo_link, except: :show
    resources :mass_times
    resources :special_notes
    resources :adoration_times
    resources :gallery_images
  end

  root to: "home#index"
end
