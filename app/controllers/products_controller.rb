class ProductsController < ApplicationController
  def index
    @products = Product.all.with_attached_image
  end
  def show
    product
    @products = Product.limit($ProductLimit-2)
  end

private

  def product
    @product ||= Product.find(params[:id])
  end
end
