class ProductCommentsController < ApplicationController

	def create
		@comment = Product.new(product_comment_params)
		@product = Product.find(params[:product_id])
		@comment.product_id = @product.id
	    if @comment.save
	    	redirect_to @product, notice: "successfully created book!"#保存された場合の移動先を指定。
	    else
	   		redirect_to @product, notice: "コメントを入力してください"
	    end
	end

	def product_comment_params
		params.require(:product_comment).permit(:name,:comment)
	end


end
