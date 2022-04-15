class CreatePhotoGalleries < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_galleries do |t|
      t.string :name
      t.text :file_image
      t.string :type_gallery
      t.boolean :display, default: false
      t.boolean :is_main_image, default: false
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
