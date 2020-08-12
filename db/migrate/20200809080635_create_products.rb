class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
		t.string	:name,					null: false, default: ""
		t.integer	:type_id,				null: false, default: ""
		t.string	:name,					null: false, default: ""
		t.text		:introduction,			null: false, default: ""
		t.integer	:price_excluding,		null: false, default: ""
		t.string	:image_id,				default: ""
		t.boolean	:out_of_stock,			null: false, default: false

      t.timestamps
    end
  end
end
