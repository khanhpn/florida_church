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

  has_one_attached :logo_icon


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
