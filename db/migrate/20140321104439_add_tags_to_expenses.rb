class AddTagsToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :tags, :string, array: true, default: []
    add_index  :expenses, :tags, using: 'gin'
  end
end
