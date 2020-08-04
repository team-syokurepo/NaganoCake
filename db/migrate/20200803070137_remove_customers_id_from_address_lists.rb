class RemoveCustomersIdFromAddressLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :address_lists, :customers_id, :integer
  end
end
