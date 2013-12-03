class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :owner_id
      t.string :name

      t.timestamps
    end
    add_index :teams, :owner_id
  end
end
