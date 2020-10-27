# frozen_string_literal: true

class CreateBulletinBoardComments < ActiveRecord::Migration[5.2]
  def change
    create_table :bulletin_board_comments do |t|
      t.integer :bulletin_board_id
      t.string :name, null: false, default: ''
      t.text :comment

      t.timestamps
    end
  end
end
