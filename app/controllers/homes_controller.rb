class HomesController < ApplicationController
  def top
  	@categories = Category.all
  	@recommend = Product.first(4)
  end

  def about
  end
end
