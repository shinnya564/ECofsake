class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
		t.integer	:order_id,			null: false
		t.integer	:product_id,		null: false
		t.string	:name,				null: false, default: ""
		t.integer	:price,				null: false
		t.integer	:quantity,			null: false
		t.integer	:production_status,	null: false

      t.timestamps
    end
  end
end
