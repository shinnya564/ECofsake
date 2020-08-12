class BulletinBoard < ApplicationRecord

	has_many :bulletin_board_comments

	validates :title, presence: true
	validates :name, presence: true
	validates :body, presence: true

end
