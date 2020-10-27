# frozen_string_literal: true

class Admins::EndUsersController < ApplicationController
  before_action :authenticate_admin!

  layout 'admins'

  def index
    per = 10
    @end_users = EndUser.page(params[:page]).per(per)
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
    if @end_user.email == 'guest@example.com'
      redirect_to(admins_end_user_path(@end_user), notice: 'ゲストユーザーの会員情報は管理者では変更できません') && return
    end
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to admins_end_user_path(@end_user)
  end

  private

  def end_user_params
    params.require(:end_user).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :postal_code, :address, :tel, :email, :delete_status)
  end
end
