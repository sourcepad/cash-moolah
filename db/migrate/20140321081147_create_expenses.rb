class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses, id: :uuid do |t|
      t.string    :name
      t.decimal   :amount,  precision: 10, scale: 2
      t.datetime  :posted_at
      
      t.timestamps
    end
  end
end
