# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer  :end_user_id, null: false
      t.integer  :product_id, null: false
      t.integer  :quantity, null: false

      t.timestamps
    end
  end
end
