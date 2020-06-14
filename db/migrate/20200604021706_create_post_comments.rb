class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.references :user, foreign_key: true, type: :integer
      t.references :team, foreign_key: true, type: :integer
      t.text :comment
      t.timestamps
    end
  end
end
