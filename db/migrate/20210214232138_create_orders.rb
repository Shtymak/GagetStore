class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :delivery_type
      t.integer :payment_type
      t.string :description
      t.integer :state
      t.string :address

      t.timestamps
    end
  end
end
