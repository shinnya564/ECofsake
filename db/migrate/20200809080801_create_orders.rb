class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
		t.integer	:end_user_id,		null: false, default: ""
		t.string	:shipping_name,		null: false, default: ""
		t.string	:postal_code,		null: false, default: ""
		t.string	:shipping_address,	null: false, default: ""
		t.integer	:total_quantity,	null: false, default: ""
		t.integer	:charriage,			null: false, default: ""
		t.integer	:billing_amount,	null: false, default: ""
		t.integer	:status_flg,		null: false, default: ""
		t.integer	:payment_flg,		null: false, default: ""

      t.timestamps
    end
  end
end
