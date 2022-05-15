class ChangeUserType < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :user_type, :integer, using: 'user_type::integer', index: true
  end
end
