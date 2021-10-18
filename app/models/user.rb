class User < ApplicationRecord
  has_many :introductions
  has_many :masses
  has_many :linked_logos
  has_many :mass_times
  has_many :special_notes
  has_many :adoration_times
  has_many :gallery_images

  has_one_attached :logo_icon


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
