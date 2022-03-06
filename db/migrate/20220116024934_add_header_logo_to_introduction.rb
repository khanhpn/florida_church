class AddHeaderLogoToIntroduction < ActiveRecord::Migration[6.1]
  def change
    add_column :introductions, :header_logo_icon, :text
  end
end
