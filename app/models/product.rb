class Product < ApplicationRecord

	belongs_to :type

	has_many :product_comments, dependent: :destroy
	has_many :carts, dependent: :destroy
	has_many :favorites, dependent: :destroy

	attachment :image, destroy: false

	validates :name, presence: true, presence: { message: "商品名が空白です"}
	validates :name, uniqueness: true
	validates :introduction,presence: true, presence: { message: "商品説明が空白です"}
	validates :price_excluding, presence: true, presence: { message: "価格が空白です"}

	def favorited_by?(end_user)
    	favorites.where(end_user_id: end_user.id).exists?
  	end

  	#商品検索
	def Product.search(search)
	    Product.where(['name LIKE ?', "%#{search}%"])
	end

end
