class CreateBelongs < ActiveRecord::Migration[5.2]
  def change
    create_table :belongs do |t|
      t.integer :user_id
      t.integer :team_id
	  t.boolean :belong, default: false
      t.timestamps
    end
    add_foreign_key :users, :teams
  end
end
