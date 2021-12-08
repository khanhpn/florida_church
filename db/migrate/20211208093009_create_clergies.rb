class CreateClergies < ActiveRecord::Migration[6.1]
  def change
    create_table :clergies do |t|
      t.string :name
      t.text :content
      t.text :image_user
      t.boolean :display
      t.belongs_to :users, index: true

      t.timestamps
    end
  end
end
