class Introduction < ApplicationRecord
  belongs_to :user
  has_one_attached :logo_icon

  validates :name, presence: true
  validates :content, presence: true
  validates :youtube_url, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :copywrite, presence: true
end
