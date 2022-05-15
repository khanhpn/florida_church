class CreatePhotoGalleries < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_galleries do |t|
      t.string :name
      t.text :file_image
      t.boolean :display, default: false
      t.boolean :is_main_image, default: false

      t.timestamps
    end
  end
end
