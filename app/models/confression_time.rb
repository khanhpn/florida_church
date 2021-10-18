class ConfressionTime < ApplicationRecord
  belongs_to :user

  validates :name, :content, :presence
end
