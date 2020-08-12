class Admins::ProductsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@products = Product.page(params[:page])
	end

	def show
		@product = Product.find(params[:id])
		@product_price = @product.price * 1.08
	end

	def new
		@product = Product.new
		@category = Category.all
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admins_product_path(@product),notice: "#{@product.name}が追加されました"
		else
			render 'new'
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admins_product_path(@product)
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def product_params
		params.require(:product).permit(:name, :image, :price, :desctiption, :category_id, :status)
	end
end
