class Product < ApplicationRecord
	 has_many :cart_products, dependent: :destroy
	 has_many :product_orders, dependent: :destroy
	 belongs_to :category
	 attachment :image
	 validates :name, {presence: true}
	 validates :desctiption, {presence: true}
	 validates :category_id, {presence: true}
	 validates :price, {presence: true}

	  def self.search(search,word)
        if search == "forward_match"
                        @product = Product.where("name LIKE?","#{word}%")
        elsif search == "backward_match"
                        @product = Product.where("name LIKE?","%#{word}")
        elsif search == "perfect_match"
                        @product = Product.where("#{word}")
        elsif search == "partial_match"
                        @product = Product.where("name LIKE?","%#{word}%")
        else
                        @product = Product.all
         end
       end
end
