class SearchesController < ApplicationController

  before_action :authenticate_admin!
   def search
    @range = params[:range]
    @word = params[:word]

      if @range == '1'
         @customers = Customer.search(@range, @word)
      elsif @range == '2'
       	 @products = Product.search(@range, @word)
      else
        redirect_to request.referer
      end
    end



end
