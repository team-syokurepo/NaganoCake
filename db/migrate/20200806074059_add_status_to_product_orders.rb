class AddStatusToProductOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :product_orders, :status, :integer
  end
end
