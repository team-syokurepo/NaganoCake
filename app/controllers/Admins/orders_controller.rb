class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
	def index
		# @order_find = Order.find_by(id: params[:id])
		@customer_id = params[:customer_id]
		if @customer_id.blank?
			@orders = Order.page(params[:page])
		else
			@customer = Customer.find(@customer_id)
			@orders = Order.where(customer_id: @customer_id).page(params[:page])
		end
	end

	def show
		  @order = Order.find_by(id: params[:id])
		  @freight = 800
		  @product_orders = ProductOrder.where(order_id: @order.id)
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

		params.require(:order).permit(:freight, :status, :postal_code, :address, :name, :how_to_pay, :price, :product_order_id, :customer_id)

	end


	def product_order_params
		params.require(:product_order).permit(:status, :product_order_id, :product_id)
	end

end
