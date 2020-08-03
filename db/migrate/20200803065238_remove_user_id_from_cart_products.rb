class RemoveUserIdFromCartProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_products, :user_id, :integer
  end
end
