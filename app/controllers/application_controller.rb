class ApplicationController < ActionController::Base
  before_action :current_cart
  $ProductLimit = 8

    def current_cart
      @current_cart ||= if session[:cart_id]
                          Cart.find(session[:cart_id])
                        else
                          cart = Cart.create!
                          session[:cart_id] = cart.id
                          cart
                        end
                      end
private

  def search
    names = products.arel_table[:name]
    descriptions = products.arel_table[:description]
    @products = products.where(names.matches("%#{params[:search]}%")).or(products.where(descriptions.matches("%#{params[:search]}%")))
  end

  def products
    @products ||= Product.all.with_attached_image
  end

end
