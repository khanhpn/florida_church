class AddSlugToWelcome < ActiveRecord::Migration[6.1]
  def change
    add_column :welcomes, :slug, :string
    add_index :welcomes, :slug, unique: true
  end
end
