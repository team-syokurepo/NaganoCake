class RemoveStatusFromProductOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_orders, :status, :string
  end
end
