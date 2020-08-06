class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@orders = Order.page(params[:page])
	end

	def show
		@order = Order.find(params[:id])
		@freight = 800
		@product_orders = ProductOrder.all
	end

	def today
		@today = Order.where(created_at: Time.zone.now.in_time_zone.all_day)
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		redirect_to request.referer

	end

	def product_update
		product_order = ProductOrder.find(params[:id])
		product_order.update(product_order_params)
		redirect_to request.referer
	end


	private

	def order_params
		params.require(:order).permit(:status)
	end


	def product_order_params
		params.require(:product_order).permit(:status)
	end
end
