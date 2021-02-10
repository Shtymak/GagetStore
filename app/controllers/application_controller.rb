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
end
