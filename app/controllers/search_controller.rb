class SearchController < ApplicationController

	def search
		@model = params[:model]
		@searchproducts = Product.search(params[:search], @model)

	    @TAX = 1.08
	    @types = Type.where(invalid_status: true)

	  	#商品一覧表示しないものチェック
	    @number = 0
	    @loop = 0

	    per = 8
	    @searchproducts = Product.where(out_of_stock: false).page(params[:page]).per(per)
	end
end