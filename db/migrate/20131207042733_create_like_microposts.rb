class CreateLikeMicroposts < ActiveRecord::Migration
  def change
    create_table :like_microposts do |t|
      t.integer :micropost_id
      t.integer :user_id

      t.timestamps
    end
  end
end
