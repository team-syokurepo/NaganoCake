class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :freight
      t.string :status
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :how_to_pay

      t.timestamps
    end
  end
end
