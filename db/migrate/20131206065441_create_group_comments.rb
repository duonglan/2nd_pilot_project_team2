class CreateGroupComments < ActiveRecord::Migration
  def change
    create_table :group_comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :group_id
      t.integer :group_micropost_id 

      t.timestamps
    end
  end
end
