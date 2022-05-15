class CreateWorships < ActiveRecord::Migration[6.1]
  def change
    create_table :worships do |t|
      t.string :title
      t.references :worshipable, polymorphic: true
      t.text :worship_upload
      t.timestamps
    end
  end
end
