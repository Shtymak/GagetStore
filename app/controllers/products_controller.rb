class ProductsController < ApplicationController
before_action :product, only: [:show]

  def index
    @products = Product.all.with_attached_image
    search
  end
  def show
    product
    @products = Product.limit($ProductLimit-2)
  end

  def add_to_cart
    if cart_product = current_cart.cart_products.find_by(product_id: product.id)
    cart_product.update(count: cart_product.count.to_i + 1)
  else
    new_cart_product = current_cart.cart_products.build(product: product, count: 1)
    new_cart_product.save
  end
    end
    def remove_from_cart
    if cart_product = current_cart.cart_products.find_by(product_id: product.id)
      cart_product.delete
    end
    respond_to do |format|
      format.json { render json: '' }
    end
  end

  def change_count_in_cart
    if cart_product = current_cart.cart_products.find_by(product_id: product.id)
      cart_product.update(count: params[:count])
    end
    respond_to do |format|
      format.json { render json: '' }
    end
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
