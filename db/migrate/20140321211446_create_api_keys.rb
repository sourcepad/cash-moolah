class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token, null: false
      t.string :user_id,      null: false
      t.boolean :active,      null: false, default: true
      t.datetime :expires_at

      t.timestamps
    end

    add_index :api_keys,  :user_id
    add_index :api_keys,  :access_token, unique: true
  end
end
