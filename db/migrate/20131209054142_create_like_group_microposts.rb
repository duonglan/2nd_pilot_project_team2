class CreateLikeGroupMicroposts < ActiveRecord::Migration
  def change
    create_table :like_group_microposts do |t|
      t.integer :group_micropost_id
      t.integer :user_id

      t.timestamps
    end
  end
end
