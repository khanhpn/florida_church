class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.text :google_map
      t.text :office_hour

      t.timestamps
    end
  end
end
