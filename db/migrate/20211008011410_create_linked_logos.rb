class CreateLinkedLogos < ActiveRecord::Migration[6.1]
  def change
    create_table :linked_logos do |t|
      t.string :name
      t.text :logo_linked
      t.boolean :display
      t.belongs_to :user
      t.timestamps
    end
  end
end
