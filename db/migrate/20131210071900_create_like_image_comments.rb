class CreateLikeImageComments < ActiveRecord::Migration
  def change
    create_table :like_image_comments do |t|
      t.integer :image_comment_id
      t.integer :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
