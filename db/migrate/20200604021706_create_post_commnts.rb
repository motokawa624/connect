class CreatePostCommnts < ActiveRecord::Migration[5.2]
  def change
    create_table :post_commnts do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.text :comment
      t.timestamps
    end
  end
end
