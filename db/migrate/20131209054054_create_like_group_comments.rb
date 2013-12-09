class CreateLikeGroupComments < ActiveRecord::Migration
  def change
    create_table :like_group_comments do |t|
      t.integer :group_comment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
