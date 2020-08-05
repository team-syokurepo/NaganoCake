class Customers::CartProductsController < ApplicationController
	before_action :authenticate_customer!
	def index
		@cart_products = current_customer.cart_products
		@total_price = 0
		@cart_products.each do |cart_product|
			@total_price += cart_product.product.price * cart_product.quantity
		end
	end

	def create
		@cart_product =  CartProduct.new(cart_product_params)
		@cart_product.customer_id = current_customer.id
		if @cart_product.save
			redirect_to customers_cart_products_path
		else
			@product = Product.find(params[:product_id])
			@product_price = @product.price * 1.08
			@categories = Category.all
			 render("customers/products/show")
		end
	end

	def destroy
		cart_product = CartProduct.find(params[:id])
		cart_product.destroy
		redirect_to request.referer
	end

	def update
		cart_product = CartProduct.find(params[:id])
		cart_product.update(cart_product_params)
		redirect_to request.referer
	end


	def empty
		cart_products = current_customer.cart_products
		cart_products.destroy_all
		redirect_to request.referer
	end



private
	def cart_product_params
		params.require(:cart_product).permit(:product_id, :quantity, :customer_id)
	end



end
