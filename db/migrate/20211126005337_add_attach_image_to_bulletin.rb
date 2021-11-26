class AddAttachImageToBulletin < ActiveRecord::Migration[6.1]
  def change
    add_column :bulletins, :image_content, :text
  end
end
