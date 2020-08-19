class Product < ApplicationRecord

	belongs_to :type

	has_many :product_comments, dependent: :destroy
	has_many :carts, dependent: :destroy
	has_many :favorites, dependent: :destroy

	attachment :image, destroy: false

	validates :name, presence: true
	validates :introduction, presence: true
	validates :price_excluding, presence: true

	def favorited_by?(end_user)
    	favorites.where(end_user_id: end_user.id).exists?
  	end

  	#商品検索
	def Product.search(search)
	    Product.where(['name LIKE ?', "%#{search}%"])
	end

end
