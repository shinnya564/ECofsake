class AddressesController < ApplicationController

  before_action :authenticate_end_user!

  def index
    @end_user = EndUser.find(params[:end_user_id])
    if @end_user.id != current_end_user.id
      redirect_to "/end_users/#{current_end_user.id}/addresses"
    end
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
      redirect_to request.referer, notice: "空白があります"
    end
  end

  def edit
    @end_user = EndUser.find(params[:end_user_id])
    @address = Address.find(params[:id])
    if @end_user != current_end_user
      redirect_to "/end_users/#{current_end_user.id}/addresses"
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to end_user_addresses_path(current_end_user)
    else
      redirect_to action: :index, notice: "変更しました"
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
