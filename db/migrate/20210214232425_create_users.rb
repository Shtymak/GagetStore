class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :cart_id
      t.string :description

      t.timestamps
    end
  end
end
