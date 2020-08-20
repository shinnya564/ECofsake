class FavoritesController < ApplicationController

 before_action :authenticate_end_user!

	def create
    	product = Product.find(params[:product_id])
    	end_user = current_end_user
    	favorite = Favorite.new(product_id: product.id,)
		favorite.end_user_id = end_user.id
    	favorite.save
	    redirect_to request.referer
	end

	def destroy
	    product = Product.find(params[:product_id])
	    favorite = Favorite.find_by(product_id: product.id)
	    if favorite.end_user_id == current_end_user.id
	    	favorite.destroy
	    	redirect_to request.referer
	    else
	    	redirect_to request.referer
	    end
	end

end
