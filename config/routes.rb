Rails.application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: { sessions: 'users/sessions' } do
    get 'admin/login', to: 'devise/sessions#new'
    delete 'admin/logout', to: 'devise/sessions#destroy'
  end

  namespace :admin do
    get "/", to: 'dashboard#index'
    resources :introduction, except: :show
    resources :mass
    resources :users
    resources :logo_link, except: :show
    resources :mass_times
    resources :special_notes
    resources :adoration_times
    resources :gallery_images do
      member do
        delete "delete_gallery/:gallery_id", to: "gallery_images#delete_gallery", as: "delete_gallery"
      end
    end
    resources :bulletin, except: :show
    resources :teaching_mass

    resources :altar_server do
      member do
        post 'children', to: 'altar_server#children'
        get 'new_children', to: 'altar_server#new_children'
        get 'detail_children/:children_id', to: 'altar_server#detail_children', as: 'altar_server_detail_children'
        delete 'detail_children/:children_id', to: 'altar_server#delete_children'
        put 'update_children/:children_id', to: 'altar_server#update_children', as: 'altar_server_update_children'
      end
    end

    resources :altar_society
    resources :children_liturgy
    resources :ecuharistic_ministry
    resources :funeral
    resources :lector
    resources :music_ministry
    resources :ushers_hospital
    resources :player_group
    resources :sacramental
    resources :anointing
    resources :holyorders
    resources :marriage
    resources :confirmation
    resources :eucharist
    resources :reconciliation
    resources :baptism

    resources :welcome
    resources :environment_church
    resources :history_church
    resources :council
    resources :staff
    resources :deacon
    resources :clergy
    resources :google_map
  end

  root to: "home#index"
  get 'contact', to: "contact#index"
  post 'contact', to: "contact#send_contact"
  get 'bulletin', to: "bulletin#index"
  get 'teaching_mass', to: "teaching_mass#index"
  get 'altar_server', to: "altar_server#index"
  get 'altar_server/:id', to: "altar_server#show", as: "al_detail_page"
  get 'altar_society', to: "altar_society#index"
  get 'children_liturgy', to: "children_liturgy#index"
  get 'ecuharistic_ministry', to: "ecuharistic_ministry#index"
  get 'funeral', to: "funeral#index"
  get 'lector', to: "lector#index"
  get 'music_ministry', to: "music_ministry#index"
  get 'ushers_hospital', to: "ushers_hospital#index"
  get 'player_group', to: "player_group#index"
  get 'sacramental', to: "sacramental#index"
  get 'anointing', to: "anointing#index"
  get 'holyorders', to: "holyorders#index"
  get 'marriage', to: "marriage#index"
  get 'confirmation', to: "confirmation#index"
  get 'eucharist', to: "eucharist#index"
  get 'reconciliation', to: "reconciliation#index"
  get 'baptism', to: "baptism#index"

  # about us
  get 'environment_church', to: 'environment_church#index'
  get 'history_church', to: 'history_church#index'
  get 'council', to: 'council#index'
  get 'staff', to: 'staff#index'
  get 'deacon', to: 'deacon#index'
  get 'clergy', to: 'clergy#index'
  get 'welcome', to: 'welcome#index'
end
