Rails.application.routes.draw do

  devise_for :users, skip: [:registrations], controllers: { sessions: 'users/sessions' } do
    get 'admin/login', to: 'devise/sessions#new'
    delete 'admin/logout', to: 'devise/sessions#destroy'
  end

  namespace :admin do
    get "/", to: 'dashboard#index'
    post 'uploader/image', to: 'uploader#image'
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

    resources :adult
    resources :youth
    resources :children
    resources :pray_garden

    resources :art_craft_group
    resources :food_basket
    resources :haitian_prayer
    resources :hospital_visit
    resources :memorial_book
    resources :respect_life
    resources :women_grace

    resources :parish_event
    resources :faith_formation
    resources :children_youth
    resources :knight_columb
    resources :ladies_saint_john
    resources :eucharistic_saint_video

    resources :category_gallery do
      resources :photo_gallery
    end

    resources :photo_gallery do
      member do
        delete "delete_gallery/:category_id", to: "photo_gallery#delete_gallery", as: "delete_photo_gallery"
      end
    end
    resources :planned_giving
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

  get 'adult', to: 'adult#index'
  get 'youth', to: 'youth#index'
  get 'children', to: 'children#index'
  get 'pray_garden', to: 'pray_garden#index'

  get 'respect_life', to: 'respect_life#index'
  get 'memorial_book', to: 'memorial_book#index'
  get 'hospital_visit', to: 'hospital_visit#index'
  get 'haitian_prayer', to: 'haitian_prayer#index'
  get 'food_basket', to: 'food_basket#index'
  get 'art_craft_group', to: 'art_craft_group#index'
  get 'women_grace', to: 'women_grace#index'

  get 'parish_event', to: 'parish_event#index'
  get 'faith_formation', to: 'faith_formation#index'
  get 'children_youth', to: 'children_youth#index'
  get 'knight_columb', to: 'knight_columb#index'
  get 'ladies_saint_john', to: 'ladies_saint_john#index'
  get 'eucharistic_saint_video', to: 'eucharistic_saint_video#index'

  get 'photo_gallery', to: 'photo_gallery#index'
  get 'photo_gallery/:id', to: 'photo_gallery#show', as: "photo_gallery_show"
  get 'planned_giving', to: 'planned_giving#index'
end
