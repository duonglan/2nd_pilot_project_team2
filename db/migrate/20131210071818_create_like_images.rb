class CreateLikeImages < ActiveRecord::Migration
  def change
    create_table :like_images do |t|
      t.integer :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
