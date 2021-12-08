class CreateHistoryChurches < ActiveRecord::Migration[6.1]
  def change
    create_table :history_churches do |t|
      t.string :name
      t.text :content
      t.boolean :display
      t.belongs_to :users, index: true
      t.timestamps
    end
  end
end
