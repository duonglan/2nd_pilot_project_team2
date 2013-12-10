class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id
      t.boolean :status, default: true
      t.integer :friend_id
      t.timestamps
    end
 
  end
end
