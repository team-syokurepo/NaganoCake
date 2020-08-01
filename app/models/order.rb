class Order < ApplicationRecord
	belongs_to :customer
	has_many :product_orders, dependent: :destroy

end
