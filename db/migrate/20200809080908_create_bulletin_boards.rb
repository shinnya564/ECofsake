class CreateBulletinBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :bulletin_boards do |t|
		t.string	:title,						null: false, default: ""
		t.string	:name,						null: false, default: ""
		t.text		:body,						null: false
		t.string	:delete_password,			null: false, default: ""

      t.timestamps
    end
  end
end
