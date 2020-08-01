class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_id
      t.integer :price
      t.text :desctiption
      t.integer :category_id
      t.boolean :status

      t.timestamps
    end
  end
end
