class AddUserIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :user_id, :string
    add_index :expenses, :user_id
  end
end
