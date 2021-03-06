# frozen_string_literal: true

class SearchController < ApplicationController
  def search_products
    @search = Product.search(params[:search])
    @types = Type.where(invalid_status: true)
    @number = 0

    @TAX = ENV['TAX'].to_f
    @loop = 0

    per = 9
    @products = @search.where(out_of_stock: false, type_id: @types.pluck(:id)).page(params[:page]).per(per)

    @products.each do |_product|
      @number += 1
    end
  end

  def search_types
    @types = Type.where(invalid_status: true)
    @number = 0

    @TAX = ENV['TAX'].to_f
    @all_products = Product.where(type_id: params[:format])
    @loop = 0

    # ジャンル抽出
    types = Type.where(invalid_status: true)
    per = 9
    @products = @all_products.where(out_of_stock: false, type_id: types.pluck(:id)).page(params[:page]).per(per)

    @products.each do |_product|
      @number += 1
    end
  end
end
