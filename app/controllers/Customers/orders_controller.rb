class Customers::OrdersController < ApplicationController
	def index
		@customer = current_customer
		@orders = @customer.orders
	end

	def show
	end

	def new
	end

	def create
	end

	def confirm
	end

	def thanks
	end
end
