class Admins::TypesController < ApplicationController

  before_action :authenticate_admins!

  layout 'admins'

  def index
    per = 10
  	@type = Type.new
  	@types = Type.page(params[:page]).per(per)
  end

  def create
  	@type = Type.new(type_params)
  	@type.save
  	redirect_to admins_types_path
  end

  def edit
  	@type = Type.find(params[:id])
  end

  def update
  	@type = Type.find(params[:id])
  	@type.update(type_params)
  	redirect_to admins_types_path
  end

  private
  def type_params
  	params.require(:type).permit(:name, :invalid_status)
  end
end
