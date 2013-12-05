class CreateGroupMicroposts < ActiveRecord::Migration
  def change
    create_table :group_microposts do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :content

      t.timestamps
    end
  end
end
