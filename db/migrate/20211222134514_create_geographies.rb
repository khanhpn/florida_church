class CreateGeographies < ActiveRecord::Migration[6.1]
  def change
    create_table :geographies do |t|
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
