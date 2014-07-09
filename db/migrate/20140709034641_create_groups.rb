class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.datetime :created
      t.datetime :last_activity

      t.timestamps
    end
  end
end
