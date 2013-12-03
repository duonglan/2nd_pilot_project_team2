class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
     add_index  :group_members,[:group_id, :user_id]
  end
end
