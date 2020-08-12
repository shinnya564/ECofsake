class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
		t.integer	:order_id,			null: false, default: ""
		t.integer	:product_id,		null: false, default: ""
		t.string	:name,				null: false, default: ""
		t.integer	:price,				null: false, default: ""
		t.integer	:quantity,			null: false, default: ""
		t.integer	:production_status,	null: false, default: ""

      t.timestamps
    end
  end
end
