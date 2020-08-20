class OrderItemsController < ApplicationController

 before_action :authenticate_end_user!

  def create
  	@order_item = new(order_item_params)
  	@order_item.production_status = 0
  	@order_item.save
  	@end_user = current_end_user
    @carts = @end_user.carts
    @carts.destroy_all
  	redirect_to end_user_thanks_path
  end

  private

  def order_item_params
    params.require(:order_item).permit(:order_id,:product_id,:name, :price, :quantity)
  end

end
