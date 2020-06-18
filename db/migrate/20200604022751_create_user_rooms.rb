# frozen_string_literal: true

class CreateUserRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rooms do |t|
      t.references :user, foreign_key: true, type: :bigint
      t.references :room, foreign_key: true, type: :bigint
      t.timestamps
    end
  end
end
