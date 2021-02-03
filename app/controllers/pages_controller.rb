class PagesController < ApplicationController
def index
  @products = Product.limit($ProductLimit)
end
end
