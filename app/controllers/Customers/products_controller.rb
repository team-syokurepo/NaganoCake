class Customers::ProductsController < ApplicationController
	def index
		@categories = Category.all
		@category_id = params[:category_id]
		if @category_id.blank?
			@products = Product.page(params[:page])
			@products_count = Product.all
		else
			@category = Category.find(@category_id)
		    @products = Product.where(category_id: @category_id).page(params[:page])
		    @products_count = Product.where(category_id: @category_id)
		end
	end

	def show
		@product = Product.find(params[:id])
		@product_price = @product.price * 1.08
		@categories = Category.all
		@cart_product = CartProduct.new
	end
end
