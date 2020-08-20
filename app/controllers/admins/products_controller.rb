class Admins::ProductsController < ApplicationController

  before_action :authenticate_admins!

  layout 'admins'


  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_products_path
    else
      render :new
    end
  end

  def index
    @products = Product.page(params[:page]).reverse_order.per(10)
  end

  def show
    @product = Product.find(params[:id])
    @type = @product.type.name
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admins_product_path(@product.id)
  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :type_id, :price_excluding, :out_of_stock, :image)
  end
end
