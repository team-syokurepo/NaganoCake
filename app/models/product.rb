class Product < ApplicationRecord
	 has_many :cart_products, dependent: :destroy
	 has_many :product_orders, dependent: :destroy
	 belongs_to :category
	 attachment :image
	 validates :name, {presence: true}
	 validates :desctiption, {presence: true}
	 validates :category_id, {presence: true}
	 validates :price, {presence: true}

	  def Product.search(range,word)
        if range == "2"
           @product = Product.where("name LIKE ? OR status LIKE ?","%#{word}%","%#{word}")
        else
           @product = Product.all
         end
       end
end
