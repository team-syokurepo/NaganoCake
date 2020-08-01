class Product < ApplicationRecord
	 has_many :cart_products, dependent: :destroy
	 has_many :product_orders, dependent: :destroy
	 belongs_to :category
	 attachment :image
end
