class CreateArtCraftGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :art_craft_groups do |t|
      t.string :name
      t.string :name_link
      t.text :content
      t.text :file_image
      t.text :file_pdf
      t.string :link
      t.boolean :display, default: false
      t.boolean :is_main_article, default: false
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
