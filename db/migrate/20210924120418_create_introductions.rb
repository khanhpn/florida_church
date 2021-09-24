class CreateIntroductions < ActiveRecord::Migration[6.1]
  def change
    create_table :introductions do |t|
      t.string :name
      t.text :content
      t.text :youtube_url
      t.text :address
      t.string :phone
      t.string :email
      t.string :copywrite
      t.text :office_hour
      t.string :flict_channel
      t.string :youtube_channel_url
      t.string :facebook_channel
      t.text :logo_icon

      t.belongs_to :user
      t.timestamps
    end
  end
end
