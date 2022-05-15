class Worship < ApplicationRecord
  has_one_attached :worship_upload

  belongs_to :worshipable, polymorphic: true
end
