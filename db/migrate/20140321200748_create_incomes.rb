class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string    :name
      t.decimal   :amount,  precision: 10, scale: 2
      t.datetime  :posted_at
      t.string    :user_id

      t.timestamps
    end

    add_index :incomes, :user_id
    add_index :incomes, :posted_at
  end
end
