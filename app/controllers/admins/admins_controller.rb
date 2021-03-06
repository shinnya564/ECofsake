# frozen_string_literal: true

class Admins::AdminsController < ApplicationController
  before_action :authenticate_admin!

  layout 'admins'

  def index
    per = 10
    @admin = Admin.new
    @admins = Admin.page(params[:page]).per(per)
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
    redirect_to admins_admins_path if @admin.id == 0
  end

  def update
    @admin = Admin.find(params[:id])
    @admin.update(admin_params)
    redirect_to admins_admins_path(@admin)
  end

  private

  def admin_params
    params.require(:admin).permit(:email)
  end
end
