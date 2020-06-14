class CreateBelongs < ActiveRecord::Migration[5.2]
  def change
    create_table :belongs do |t|
	  t.references :user, foreign_key: true, type: :integer
	  t.references :team, foreign_key: true, type: :integer
	  t.boolean :belong, default: false
      t.timestamps
    end
  end
end
