# frozen_string_literal: true

class Cart::ProductComponent < ViewComponent::Base
  def initialize(product:)
    @product = product
  end

end
