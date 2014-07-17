class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.integer :roll_call_id
      t.text :location

      t.timestamps
    end
  end
end
