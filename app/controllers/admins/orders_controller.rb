class Admins::OrdersController < ApplicationController

  before_action :authenticate_admins!

  layout 'admins'

  def index
    case params[:order_sort]
    when "0"
      @orders = Order.where(end_user_id: params[:end_user_id]).order(created_at: "DESC")
    else
      @orders = Order.all.order(created_at: "DESC")
    end
  end

  def show
  	@TAX = 1.08
    @order = Order.find(params[:id])
    @items = @order.order_items
    @total_price = 0
    @items.each do |item|
    	@total_price += item.price * item.quantity
    end
    @total_price
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status_params)
    redirect_to admins_end_user_order_path(@order.id)
  end

  private

  def status_params
    params.require(:order).permit(:status_flg)
  end
end
