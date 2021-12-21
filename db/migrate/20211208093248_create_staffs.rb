class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.string :name
      t.text :content
      t.text :image_user
      t.boolean :display
      t.integer :display_order, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
