class Order < ApplicationRecord
  has_many :order_products
 accepts_nested_attributes_for :order_products
 belongs_to :user
 accepts_nested_attributes_for :user

 enum payment_type:["cash","card"]
 enum delivery_type:["self_pickup","nova_poshta"]
end
