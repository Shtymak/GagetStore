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
    @novaposhta_city = %i[Київ Львів Ужгород]
  end


  def create
    @order = Order.create(order_params)
    if @order.save
      current_cart.cart_products.delete_all
        text = "Нове замовлення №#{@order.id}\n
        "+@order.order_products.map do |order_product|
              "*#{order_product.product.name}\n
          | Ціна за одиницю: #{order_product.price} \n
          | кількість: #{order_product.count}"
          end.join(" \n")
        Telegram::SendMessageJob.perform_later(text)
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
