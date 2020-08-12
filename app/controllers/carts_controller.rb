class CartsController < ApplicationController

  def index
    @TAX = 1.08    #税込価格計算用、税率8％
    @price = 0     #商品税込価格用
    @total = 0     #合計計算用初期化
    @end_user = current_end_user
    @carts = @end_user.carts

    @carts.each do |cart|
      @price = (cart.product.price_excluding * @TAX).ceil
      @total = @total + @price * cart.quantity
    end
  end

  def create
    @cart = Cart.new(cart_params) #cartモデルのテーブルを使用しているのでcartコントローラで保存する。
    @cart.end_user_id = current_end_user.id
    @cart.product_id = params[:cart][:product_id_delivary]
    @cart.save
    redirect_to end_user_carts_path, notice: "カートに商品を入れました"#保存された場合の移動先を指定。
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to request.referer, notice: "個数を変更しました!"
    else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
      redirect_to request.referer
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to request.referer, notice: "商品をカートから取り出しました!"
  end

  def all_destroy
    @end_user = current_end_user
    @carts = @end_user.carts
    @carts.destroy_all
    redirect_to request.referer, notice: "カートから全ての商品を取り出しました!"
  end

  private

  def cart_params
    params.require(:cart).permit(:quantity)
  end

end
