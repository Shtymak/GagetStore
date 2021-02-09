class PagesController < ApplicationController
def index
  @products = Product.limit($ProductLimit).with_attached_image
end
end
