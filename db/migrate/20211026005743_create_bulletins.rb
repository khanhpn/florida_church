class CreateBulletins < ActiveRecord::Migration[6.1]
  def change
    create_table :bulletins do |t|
      t.string :name
      t.text :content
      t.boolean :display, default: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
