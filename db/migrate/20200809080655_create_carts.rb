class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
		t.integer	:end_user_id,	null: false, default: ""
		t.integer	:product_id,	null: false, default: ""
		t.integer	:quantity,		null: false, default: ""

      t.timestamps
    end
  end
end
