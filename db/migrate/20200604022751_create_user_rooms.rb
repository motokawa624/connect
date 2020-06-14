class CreateUserRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rooms do |t|
      t.integer :user_id
      t.integer :team_id
      t.timestamps
    end
    add_foreign_key :users, :teams
  end
end
