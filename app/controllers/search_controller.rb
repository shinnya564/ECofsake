class SearchController < ApplicationController

	def search_products
		@search = Product.search(params[:search])
	    @types = Type.where(invalid_status: true)

	    @TAX = 1.08

	  	#商品一覧表示しないものチェック
	    @number = 0
	    @loop = 0

	    @search.each do |product|
	    	if product.out_of_stock == false
	        	if product.type.invalid_status == true
	          		@number = @number + 1
	        	else
	        	end
	      	else
	      	end
		end
	    per = 8
	    @searches = @search.where(out_of_stock: false).page(params[:page]).per(per)
	end

	def search_types
	    @TAX = 1.08
	    @all_products = Product.where(type_id: params[:format])
	   	@number = 0
	    @loop = 0


	    #ジャンル抽出
	    types = Type.where(invalid_status: true)
	    per = 8
	    @products = @all_products.where(out_of_stock: false, type_id: types.pluck(:id)).page(params[:page]).per(per)
	end
end