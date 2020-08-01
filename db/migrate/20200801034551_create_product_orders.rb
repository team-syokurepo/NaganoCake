class CreateProductOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :product_orders do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
