class EcuharisticMinistry < ApplicationRecord
  belongs_to :user
  scope :display_article, -> {where(display: true)}
end