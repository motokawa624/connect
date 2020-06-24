# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.references :user, foreign_key: true, type: :bigint
      t.references :team, foreign_key: true, type: :bigint
      t.text :comment
      t.timestamps
    end
  end
end
