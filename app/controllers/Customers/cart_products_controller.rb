class Customers::CartProductsController < ApplicationController
	def index
		@cart_products = CartProduct.all

		# @cart_product = CartProduct.find(params[:id])
	end

	def create

	end

	def destroy
		cart_product = CartProduct.find(params[:id])
		cart_product.destroy
		redirect_to request.referer

	end

	def update
		cart_product = CartProduct.find(params[:id])
		cart_product.update(cart_product_params)
		render "index"
		# redirect_to request.referer
	end


	def empty
		cart_product = current_user.product
		cart_product.destroy_all
		redirect_to request.referer
	end

private


def cart_product_params
	params.require(:cart_product).permit(:quantity)
end
end
