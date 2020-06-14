class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
    	t.references :user, foreign_key: true, type: :bigint
    	t.references :team, foreign_key: true, type: :bigint
    	t.timestamps
    end
  end
end
