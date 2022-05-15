class CreateCategoryGalleries < ActiveRecord::Migration[6.1]
  def change
    create_table :category_galleries do |t|
      t.string :name
      t.boolean :display, default: false
      t.belongs_to :user, index: true
      t.timestamps
    end

    add_column :photo_galleries, :category_gallery_id, :bigint, index: true
  end
end
