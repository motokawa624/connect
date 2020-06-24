# frozen_string_literal: true

class CreateBelongs < ActiveRecord::Migration[5.2]
  def change
    create_table :belongs do |t|
      t.references :user, foreign_key: true, type: :bigint
      t.references :team, foreign_key: true, type: :bigint
      t.boolean :belong, default: false
      t.timestamps
    end
  end
end
