class OrdersController < ApplicationController

 before_action :authenticate_end_user!

  require "payjp"

  def index
    @end_user = current_end_user
    @orders = @end_user.orders
    #@order_items = @orders.order_items
  end

  def create
      params[:order][:payment_flg] = params[:order][:payment_flg].to_i
      @order = Order.new(order_params)
      @end_user = current_end_user
      @order.end_user_id = @end_user.id
      @order.status_flg = 0

      #クレジットカード支払い料金請求
      if @order.payment_flg == "クレジットカード"
        Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
        begin
          # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
          @card = Card.find(@order.card_id)
          Payjp::Charge.create(
            amount: @order.billing_amount, #支払金額
            customer: @card.customer_id, #顧客ID
            currency: 'jpy', #日本円
          )
          # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
        rescue Payjp::PayjpError => e
          redirect_to request.referer, notice: "このカードはご利用になれません。お手数ですが、窓口までお問い合わせください。" and return
        end

        #orderレコードの保存
        if @order.save
          #order_itemレコードの作成
          @TAX = 1.08    #税込価格計算用、税率8％
          @order_items = @end_user.carts

          @order_items.each do |order_item|
            @product = Product.find(order_item.product_id)
            @order_item = OrderItem.new
            @order_item.order_id = @order.id
            @order_item.product_id = order_item.product_id
            @order_item.name = @product.name
            @order_item.price = (@product.price_excluding * @TAX).ceil
            @order_item.quantity = order_item.quantity
            @order_item.production_status = 0
            @order_item.save
          end

          #cartの中身を空にする
          @end_user = current_end_user
          @carts = @end_user.carts
          @carts.destroy_all

          redirect_to end_user_thanks_path
        else
          redirect_to request.referer, notice: '購入に失敗しました。'
        end
        #↑この辺はこちら側のテーブル設計どうりに色々しています
      else
      end
  end

  def show
    @end_user = current_end_user
    @order = Order.find(params[:id])
    @subtotal = @order.total_quantity * @order.total_quantity
    @order_items = @order.order_items
    @total_price = 0
    @order_items.each do |item|
      @total_price += item.price * item.quantity
    end
  end

  def address_check
    @order = Order.new
    @end_user = current_end_user
    @addresses = @end_user.addresses
    @cards = current_end_user.cards

  end

  def order_check
    @TAX = 1.08    #税込価格計算用、税率8％
    @price = 0     #商品税込価格用
    @subtotal =0   #小計計算用
    @total = 0     #金額合計計算用初期化
    @total_quantity = 0   #個数合計計算用初期化

    @order = Order.new
    @end_user = current_end_user
    @carts = @end_user.carts

    #totalとtotal_quantityを計算
    @carts.each do |cart|
      @price = (cart.product.price_excluding * @TAX).ceil
      @subtotal = @price * cart.quantity
      @total_quantity = @total_quantity + cart.quantity
      @total = @total + @subtotal
    end

    if @total >= 8000
      @charriage = 0
    elsif @total >= 3000
      @charriage = 500
    else
      @charriage = 1000
    end
    #支払い方法条件分岐
    @payment_flg = params[:order][:payment_flg]
    if @payment_flg == "0"
      @payment = "クレジットカード"
      @card_selection = params[:card_selection]
      card = params[:card][:card_id]
      if card == ""
        redirect_to request.referer, notice: 'クレジットカードを選択してください' and return
      else
        @card = Card.find(card)
        @customer_id = @card.customer_id
        @payment_card = @card.id
        @card_id = @card.card_id
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(@customer_id)
        @default_card_information = customer.cards.retrieve(@card_id)
        @secret = "**** **** **** " + "#{@default_card_information.last4}"
      end

      #お届け先条件分岐
      @address_selection = params[:address_selection]
      @address_id = params[:address][:address_id]
      if @address_selection == "0"
        @postal_code = @end_user.postal_code
        @shipping_address = @end_user.address
        @full_name = @end_user.family_name + @end_user.first_name
      elsif @address_selection == "1"
        #新しい住所の空白チェック
        if @address_id == ""
          redirect_to request.referer, notice: "登録済住所を選択してください"
        else
          @address = Address.find(params[:address][:address_id])
          @postal_code = @address.postal_code
          @shipping_address = @address.address
          @full_name = @address.name
        end
      elsif @address_selection == "2"
        @address = Address.new
        @postal_code = params[:order][:postal_code]
        @shipping_address = params[:order][:shipping_address]
        @full_name = params[:order][:shipping_name]

        #addressテーブルに追加
        @address.end_user_id = @end_user.id
        @address.postal_code = @postal_code
        @address.address = @shipping_address
        @address.name = @full_name
        #新しいaddressレコード作成時のバリテーションチェック
        if @address.save
        else
          redirect_to request.referer, notice: "新しいお届け先を「空白なく」入力してください"
        end
      else
        redirect_to request.referer, notice: "お届け先を指定して下さい"
      end
    elsif @payment_flg == "1"
      @payment = "代引支払"
      #お届け先条件分岐
      @address_selection = params[:address_selection]
      @address_id = params[:address][:address_id]
      if @address_selection == "0"
        @postal_code = @end_user.postal_code
        @shipping_address = @end_user.address
        @full_name = @end_user.family_name + @end_user.first_name
      elsif @address_selection == "1"
        #新しい住所の空白チェック
        if @address_id == ""
          redirect_to request.referer, notice: "登録済住所を選択してください"
        else
          @address = Address.find(params[:address][:address_id])
          @postal_code = @address.postal_code
          @shipping_address = @address.address
          @full_name = @address.name
        end
      elsif @address_selection == "2"
        @address = Address.new
        @postal_code = params[:order][:postal_code]
        @shipping_address = params[:order][:shipping_address]
        @full_name = params[:order][:shipping_name]

        #addressテーブルに追加
        @address.end_user_id = @end_user.id
        @address.postal_code = @postal_code
        @address.address = @shipping_address
        @address.name = @full_name
        #新しいaddressレコード作成時のバリテーションチェック
        if @address.save
        else
          redirect_to request.referer, notice: "新しいお届け先を「空白なく」入力してください"
        end
      else
        redirect_to request.referer, notice: "お届け先を指定して下さい"
      end
    else
      redirect_to request.referer, notice: "支払い方法を選択してください"
    end
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:end_user_id, :card_id, :shipping_name, :postal_code, :shipping_address, :total_quantity, :charriage, :billing_amount, :payment_flg)
  end
end
