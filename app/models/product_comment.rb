class ProductComment < ApplicationRecord

	belongs_to :product

	validates :comment, presence: true, length: {maximum: 200}

end
