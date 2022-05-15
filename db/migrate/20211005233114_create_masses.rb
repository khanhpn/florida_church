class CreateMasses < ActiveRecord::Migration[6.1]
  def change
    create_table :masses do |t|
      t.string :name
      t.text :content
      t.text :file_attached
      t.boolean :ticked
      t.belongs_to :user
      t.timestamps
    end
  end
end
