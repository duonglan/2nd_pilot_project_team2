class CreateImageComments < ActiveRecord::Migration
  def change
    create_table :image_comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :album_id
      t.integer :image_id

      t.timestamps
    end
  end
end
