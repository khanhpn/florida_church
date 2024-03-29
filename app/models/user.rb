class User < ApplicationRecord
  has_many :introductions
  has_many :masses
  has_many :linked_logos
  has_many :mass_times
  has_many :special_notes
  has_many :adoration_times
  has_many :gallery_images
  has_many :bulletins
  has_many :altar_serveres
  has_many :altar_societies
  has_many :childrens_liturgies
  has_many :ecuharistic_ministries
  has_many :funerals
  has_many :music_ministries
  has_many :prayer_groups
  has_many :teaching_masses
  has_many :ushers_hospitalities
  has_many :lectors
  has_many :anointing_thesicks
  has_many :baptisms
  has_many :confirmations
  has_many :eucharists
  has_many :holyorders
  has_many :marriages
  has_many :reconciliations
  has_many :sacramentals
  has_many :clergies
  has_many :deacons
  has_many :staffs
  has_many :councils
  has_many :history_churchs
  has_many :environment_churchs

  has_many :childs
  has_many :adults
  has_many :youths
  has_many :pray_gardens

  has_many :food_baskets
  has_many :haitian_prayers
  has_many :hospital_visits
  has_many :memorial_books
  has_many :respect_lifes
  has_many :art_craft_groups
  has_many :women_graces

  has_many :parish_events
  has_many :faith_formations
  has_many :children_youths
  has_many :knight_columbs
  has_many :ladies_saint_johns
  has_many :eucharistic_saint_videos
  has_many :planned_givings

  has_many :category_galleries
  has_many :photo_galleries, through: :category_galleries

  has_one_attached :logo_icon


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # super_admin -> all permission
  # admin -> limit some permissions
  # moderator -> limit some permissions
  # guess -> only view some information
  enum user_type: {super_admin: 0, admin: 1, moderator: 2, guess: 3}
end
