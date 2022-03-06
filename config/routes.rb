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
    resources :teaching_mass, except: :show

    resources :altar_server do
      member do
        post 'children', to: 'altar_server#children'
        get 'new_children', to: 'altar_server#new_children'
        get 'detail_children/:children_id', to: 'altar_server#detail_children', as: 'altar_server_detail_children'
        delete 'detail_children/:children_id', to: 'altar_server#delete_children'
        put 'update_children/:children_id', to: 'altar_server#update_children', as: 'altar_server_update_children'
      end
    end

    resources :altar_society, except: :show
    resources :children_liturgy, except: :show
    resources :ecuharistic_ministry, except: :show
    resources :funeral, except: :show
    resources :lector, except: :show
    resources :music_ministry, except: :show
    resources :ushers_hospital, except: :show
    resources :player_group, except: :show
    resources :sacramental, except: :show
    resources :anointing, except: :show
    resources :holyorders, except: :show
    resources :marriage, except: :show
    resources :confirmation, except: :show
    resources :eucharist, except: :show
    resources :reconciliation, except: :show
    resources :baptism, except: :show

    resources :welcome, except: :show
    resources :environment_church, except: :show
    resources :history_church, except: :show
    resources :council, except: :show
    resources :staff, except: :show
    resources :deacon, except: :show
    resources :clergy, except: :show
    resources :google_map, except: :show
  end

  root to: "home#index"
  get 'contact', to: "contact#index"
  post 'contact', to: "contact#send_contact"
  get 'bulletin', to: "bulletin#index"
  get 'teaching_mass', to: "teaching_mass#index"
  get 'altar_server', to: "altar_server#index"
  get 'altar_server/:id', to: "altar_server#show"
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
