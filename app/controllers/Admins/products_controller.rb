class Admins::ProductsController < ApplicationController
	def index
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
		@category = Category.all
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admins_product(@product)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def product_params
		params.require(:product).permit(:name, :image_id, :price, :desctiption, :category_id, :status)
	end
end
