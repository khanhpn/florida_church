class CreateLectors < ActiveRecord::Migration[6.1]
  def change
    create_table :lectors do |t|
      t.string :name
      t.text :content
      t.boolean :display, default: false
      t.integer :display_order, index: true
      t.belongs_to :user

      t.timestamps
    end
  end
end
