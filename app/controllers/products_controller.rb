class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    product
  end

private

  def product
    @product ||= Product.find(params[:id])
  end
end
