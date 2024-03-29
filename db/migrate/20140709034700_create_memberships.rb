class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.boolean :owner

      t.belongs_to :user
      t.belongs_to :group

      t.timestamps
    end
  end
end
