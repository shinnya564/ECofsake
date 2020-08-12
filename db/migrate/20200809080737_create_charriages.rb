class CreateCharriages < ActiveRecord::Migration[5.2]
  def change
    create_table :charriages do |t|
		t.string	:area,	null: false, default: ""
		t.integer	:price,	null: false, default: ""

      t.timestamps
    end
  end
end
