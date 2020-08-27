class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
		t.string	:name			,null: false, default: ""
		t.boolean	:invalid_status	,null: false, default: false

      t.timestamps
    end
  end
end
