class Bulletin < ApplicationRecord
  belongs_to :user
  has_one_attached :content
  has_one_attached :image_content
end
