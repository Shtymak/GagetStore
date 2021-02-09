class CreateCartProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_products do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :count

      t.timestamps
    end
  end
end
