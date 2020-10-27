# frozen_string_literal: true

class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  layout 'admins'

  def index
    case params[:order_sort]
    when '0'
      @orders = Order.where(end_user_id: params[:end_user_id]).order(created_at: 'DESC')
    else
      @orders = Order.all.order(created_at: 'DESC')
    end
  end

  def show
    @TAX = ENV['TAX'].to_f
    @order = Order.find(params[:id])
    @items = @order.order_items
    @total_price = 0
    @items.each do |item|
      @total_price += (item.price * @TAX).ceil * item.quantity
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status_params)
    redirect_to admins_end_user_order_path(@order.id)
  end

  def earnings
    @earning_total = 0
    @collected_total = 0
    orders = Order.all
    collecteds = Order.where(status_flg: 2)
    @TAX = ENV['TAX'].to_f

    orders.each do |order|
      total_price = 0
      items = order.order_items
      items.each do |item|
        total_price += item.price * item.quantity
        @earning_total += total_price
      end
    end

    collecteds.each do |order|
      total_price = 0
      items = order.order_items
      items.each do |item|
        total_price += item.price * item.quantity
        @collected_total += total_price
      end
    end
  end

  private

  def status_params
    params.require(:order).permit(:status_flg)
  end
end
