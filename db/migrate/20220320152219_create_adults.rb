class CreateAdults < ActiveRecord::Migration[6.1]
  def change
    create_table :adults do |t|
      t.string :name
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
