class CreateProductComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_comments do |t|
    	t.integer   :product_id ,null: false
    	t.string	:name		,null: false, default: ""
		t.string	:comment	,null: false, default: ""

      t.timestamps
    end
  end
end
