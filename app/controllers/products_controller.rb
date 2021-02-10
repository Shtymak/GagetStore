class ProductsController < ApplicationController
before_action :product, only: [:show]

  def index
    @products = Product.all.with_attached_image
  end
  def show
    product
    @products = Product.limit($ProductLimit-2)
  end

  def add_to_cart
        pp new_cart_product = current_cart.cart_products.build(product: product, count: 1)
        new_cart_product.save
    end
    
    def cart
    @products = current_cart.cart_products
    respond_to do |format|
      format.html
      format.js
    end
  end


private

  def product
    @product ||= Product.find(params[:id])
  end
end
