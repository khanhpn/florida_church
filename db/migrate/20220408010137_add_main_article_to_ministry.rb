class AddMainArticleToMinistry < ActiveRecord::Migration[6.1]
  def change
    add_column :adults, :name_link, :text
    add_column :children, :name_link, :text
    add_column :youths, :name_link, :text
  end
end
