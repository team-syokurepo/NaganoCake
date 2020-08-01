class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :valid_flag

      t.timestamps
    end
  end
end
