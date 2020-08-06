class Category < ApplicationRecord
	has_many :products
	validates :name, presence: true,uniqueness: true

	  def self.search(search,word)
        if search == "forward_match"
                        @category = Category.where("name LIKE?","#{word}%")
        elsif search == "backward_match"
                        @category = Category.where("name LIKE?","%#{word}")
        elsif search == "perfect_match"
                        @category = Category.where("#{word}")
        elsif search == "partial_match"
                        @category = Category.where("name LIKE?","%#{word}%")
        else
                        @category = Category.all
         end
       end
end
