class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :albums, [:user_id, :created_at]
  end
end
