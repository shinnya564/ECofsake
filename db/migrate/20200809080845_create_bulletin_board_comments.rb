class CreateBulletinBoardComments < ActiveRecord::Migration[5.2]
  def change
    create_table :bulletin_board_comments do |t|
    	t.integer :bulletin_board_id, null:false
    	t.string :name, null: false, default: ""
		t.text	:comment, null: false, default: ""

      t.timestamps
    end
  end
end
