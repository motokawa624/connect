# frozen_string_literal: true

class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :user, foreign_key: true, type: :bigint
      t.references :room, foreign_key: true, type: :bigint
      t.text :message
      t.timestamps
    end
  end
end
