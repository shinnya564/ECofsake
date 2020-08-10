class Product < ApplicationRecord

	belongs_to :type

	has_many :product_comments

	validates :name, presence: true
	validates :introduction, presence: true
	validates :price_excluding, presence: true

end
