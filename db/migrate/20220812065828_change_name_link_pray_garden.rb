class ChangeNameLinkPrayGarden < ActiveRecord::Migration[6.1]
  def change
    rename_column :pray_gardens, :link, :name_link
  end
end
