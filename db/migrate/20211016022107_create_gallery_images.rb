class CreateGalleryImages < ActiveRecord::Migration[6.1]
  def change
    create_table :gallery_images do |t|
      t.string :name
      t.boolean :display
      t.integer :display_order
      t.text :content
      t.belongs_to :user

      t.timestamps
    end
  end
end
