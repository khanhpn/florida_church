class AddMainArticleToAltarServer < ActiveRecord::Migration[6.1]
  def change
    add_column :altar_servers, :is_main_article, :boolean, default: false
    add_column :altar_servers, :file_image, :text
    add_column :altar_servers, :file_pdf, :text
  end
end
