class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.build_user
    current_cart.cart_products.each do |cart_product|
      @order.order_products.build(
        product_id: cart_product.product_id,
        count: cart_product.count,
        price: cart_product.product.price
      )
    end
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to root_path
    else
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:delivery_type, :payment_type, :address, :description,user_attributes: %i[name phone email], order_products_attributes: %i[product_id count price])
  end
end
