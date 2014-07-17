class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone_number
      t.string :password
      t.string :first_name
      t.string :last_name
      t.datetime :last_activity
      t.string :email
      t.string :UDID

      t.timestamps
    end
  end
end
