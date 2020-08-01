class CreateAddressLists < ActiveRecord::Migration[5.2]
  def change
    create_table :address_lists do |t|
      t.integer :customers_id
      t.string :name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
