class CreateAuthKeys < ActiveRecord::Migration
  def change
    create_table :auth_keys do |t|
      t.integer :user_id
      t.string :token

      t.timestamps
    end
  end
end
