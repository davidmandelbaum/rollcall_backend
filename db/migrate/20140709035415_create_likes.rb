class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :photo_id
      t.integer :user_id
      t.datetime :time

      t.timestamps
    end
  end
end
