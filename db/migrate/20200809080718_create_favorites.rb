class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
    	t.integer	:end_user_id,	null: false, default:""
		t.integer	:product_id,	null: false, default:""
		t.boolean	:good_flag,		null: false, default: false

      t.timestamps
    end
  end
end
