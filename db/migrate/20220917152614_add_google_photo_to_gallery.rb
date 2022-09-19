class AddGooglePhotoToGallery < ActiveRecord::Migration[6.1]
  def change
    add_column :category_galleries, :enable_google_photo, :boolean, default: :false, index: true
    add_column :category_galleries, :link_google_photo, :text
    add_column :category_galleries, :file_image, :text
  end
end
