class Order < ApplicationRecord
  has_many :order_products
 accepts_nested_attributes_for :order_products
 belongs_to :user
 accepts_nested_attributes_for :user
end
