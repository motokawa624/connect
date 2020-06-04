class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :is_status, default: false
      t.string :place
      t.text :introduction
      t.string :team_image_id
      t.text :url

      t.timestamps
    end
  end
end
