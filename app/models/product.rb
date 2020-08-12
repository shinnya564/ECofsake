class Product < ApplicationRecord

	belongs_to :type

	has_many :product_comments
	has_many :carts, dependent: :destroy

	attachment :image, destroy: false

	validates :name, presence: true
	validates :introduction, presence: true
	validates :price_excluding, presence: true

end
