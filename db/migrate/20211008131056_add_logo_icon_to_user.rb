class AddLogoIconToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :logo_icon, :text
  end
end
