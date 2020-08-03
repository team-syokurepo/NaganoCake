class AddCustomerIdToAddressLists < ActiveRecord::Migration[5.2]
  def change
    add_column :address_lists, :customer_id, :integer
  end
end
