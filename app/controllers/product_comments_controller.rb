class ProductCommentsController < ApplicationController

 before_action :authenticate_end_user!

	def create
		@comment = ProductComment.new(product_comment_params)
		@product = Product.find(params[:product_id])
		@comment.product_id = @product.id
	    if @comment.save
	    	redirect_to @product, notice: "新しく投稿しました"#保存された場合の移動先を指定。
	    else
	   		redirect_to @product, notice: "コメントを入力してください"
	    end
	end

	def product_comment_params
		params.require(:product_comment).permit(:name,:comment)
	end


end
