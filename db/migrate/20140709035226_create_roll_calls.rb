class CreateRollCalls < ActiveRecord::Migration
  def change
    create_table :roll_calls do |t|
      t.datetime :started
      t.datetime :ended
      t.integer :duration
      t.text :description
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
