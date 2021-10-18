class CreateAdorationTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :adoration_times do |t|
      t.string :name
      t.text :content
      t.belongs_to :user
      t.timestamps
    end
  end
end
