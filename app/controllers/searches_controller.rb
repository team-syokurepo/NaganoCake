class SearchesController < ApplicationController
   def search
    @range = params[:range]
    search = params[:search]
    word = params[:word]

      if @range == '1'
         @customer = Customer.search(search,word)
      elsif @range == '2'
       	 @product = Product.search(search,word)
      else
         @category = Category.search(search,word)
      end
    end



end
