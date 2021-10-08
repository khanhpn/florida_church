class User < ApplicationRecord
  has_many :introductions
  has_many :masses
  has_many :linked_logos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
