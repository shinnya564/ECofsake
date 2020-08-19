class AddressesController < ApplicationController

  def index
  	@address = Address.new
    @end_user = current_end_user
    @addresses = @end_user.addresses
  end

  def create
  	@address = Address.new(address_params) #addressモデルのテーブルを使用しているのでaddressコントローラで保存
    @address.end_user_id = current_end_user.id
    if @address.save #入力されたデータをdbに保存する。
      redirect_to request.referer, notice: "配送先を追加しました"#保存された場合の移動先を指定。
    else
      @address.errors.full_messages.each do |msg|
        p msg
      end
      @end_user = current_end_user
      @addresses = @end_user.addresses
      render :index
    end
  end

  def edit
    if @end_user = current_end_user
      @address = Address.find(params[:id])
    else
      redirect_to action: :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to end_user_addresses_path(current_end_user)
    else
      @end_user = current_end_user
      render :index
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to end_user_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address ,:name)
  end

end
