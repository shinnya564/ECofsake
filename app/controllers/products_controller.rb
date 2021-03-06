# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @TAX = ENV['TAX'].to_f
    @all_products = Product.all

    @types = Type.where(invalid_status: true)

    # 退会ユーザーをアクセスさせない
    if end_user_signed_in?
      if current_end_user.delete_status == true
        redirect_to destroy_end_user_session_path
      end
    end

    # 商品一覧表示しないものチェック
    @number = 0
    @loop = 0

    @all_products.each do |product|
      next unless product.out_of_stock == false

      @number += 1 if product.type.invalid_status == true
    end
    per = 15
    types = Type.where(invalid_status: true)
    @products = Product.where(out_of_stock: false, type_id: types.pluck(:id)).page(params[:page]).per(per).order(id: 'DESC')
  end

  def show
    @TAX = ENV['TAX'].to_f
    @no = 0

    # 商品値段計算
    @product = Product.find(params[:id])
    @price = (@product.price_excluding * @TAX).ceil
    if end_user_signed_in?
      @cart = Cart.new
      @end_user = current_end_user
    end
    # コメント取得
    @comments = @product.product_comments
    @comment = ProductComment.new
  end
end
