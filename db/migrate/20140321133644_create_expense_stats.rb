class CreateExpenseStats < ActiveRecord::Migration
  def change
    create_table :expense_stats do |t|
      t.string :user_id
      t.datetime :posted_at
      t.decimal   :amount,  precision: 10, scale: 2, default: 0

      t.timestamps
    end

    add_index :expense_stats, :user_id
    add_index :expense_stats, :posted_at
  end
end
