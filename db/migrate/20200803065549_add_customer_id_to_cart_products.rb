class AddCustomerIdToCartProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_products, :customer_id, :integer
  end
end
