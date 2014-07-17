class CreateAuthKeys < ActiveRecord::Migration
  def change
    create_table :auth_keys do |t|
      t.integer :user_id
      t.string :auth_key

      t.timestamps
    end
  end
end
