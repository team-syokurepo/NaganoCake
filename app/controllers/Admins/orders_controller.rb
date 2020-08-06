class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@orders = Order.page(params[:page])
	end

	def show
	end

	def today
		@today = Order.where(created_at: Time.zone.now.in_time_zone.all_day)
	end

	def update
	end

	def product_update
	end


	private
	def order_params
		params.require(:order).permit(:freight, :status, :postal_code, :address, :name, :how_to_pay, :price)
	end
end
