class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
     add_index  :team_members,[:team_id, :user_id]
  end
end
