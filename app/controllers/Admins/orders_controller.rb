class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@orders = Order.page(params[:page])
		# @product_orders = ProductOrder.page(params[:page])
	end

	def show
		@orders = Order.all
	end

	def today
	end

	def update
		order = Order.find(params[:id])
		order.update(order_params)
		redirect_to request.referer

	end

	def product_update
		product_order = ProductOrder(params[:id])
		product_order.update(product_order_params)
		redirect_to request.referer
	end


	private
	def order_params
		params.require(:order).permit(:freight, :status, :postal_code, :address, :name, :how_to_pay, :price)
	end

	def product_order_params
		params.require(:product_order).permit(:status)
	end
end
