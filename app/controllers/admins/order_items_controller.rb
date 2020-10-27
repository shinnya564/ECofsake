class Admins::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

    def update
      item = OrderItem.find(params[:id])
      item.update(status_params)
      redirect_to request.referer
    end

    def all_update
      order = Order.find(params[:order_id])
      items = order.order_items
      items.where(production_status: [0]).update(production_status: 1)
	  order.update(status_flg: 1)
      redirect_to request.referer
    end

    def status_params
      params.require(:order_item).permit(:production_status)
    end

end
