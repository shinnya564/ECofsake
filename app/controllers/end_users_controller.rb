# frozen_string_literal: true

class EndUsersController < ApplicationController
  before_action :authenticate_end_user!

  def show
    @end_user = EndUser.find(params[:id])
    if @end_user.id != current_end_user.id
      redirect_to "/end_users/#{current_end_user.id}"
    end
  end

  def edit
    @end_user = EndUser.find(params[:id])
    if @end_user.id != current_end_user.id
      redirect_to "/end_users/#{current_end_user.id}"
    end
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to @end_user, notice: '会員情報を更新しました'
    else # if文でエラー発生時と正常時のリンク先を枝分かれにしている。
      redirect_to request.referer, notice: '更新に失敗しました.空白があります'
    end
  end

  def withdrawal
    @end_user = current_end_user
  end

  def withdrawal_update
    @end_user = EndUser.find(params[:end_user_id])
    if @end_user.email == 'guest@example.com'
      @end_user.email = 'guest@example.com' + @end_user.id.to_s
      @end_user.delete_status = true
      redirect_to(destroy_end_user_session_path) && return if @end_user.save
    end
    @end_user.delete_status = true
    @end_user.save
    redirect_to destroy_end_user_session_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :email, :postal_code, :address, :tel)
  end
end
