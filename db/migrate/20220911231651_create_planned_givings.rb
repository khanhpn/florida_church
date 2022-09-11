class CreatePlannedGivings < ActiveRecord::Migration[6.1]
  def change
    create_table :planned_givings do |t|
      t.string :name
      t.string :name_link
      t.text :content
      t.text :file_image
      t.text :file_pdf
      t.string :link
      t.boolean :display, default: false, index: true
      t.boolean :is_main_article, default: false, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
