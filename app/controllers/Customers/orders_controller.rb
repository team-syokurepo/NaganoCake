class Customers::OrdersController < ApplicationController
	def index
		@customer = current_customer
		@orders = @customer.orders
	end

	def show
        @customer = current_customer
	end

	def new
	    @customer = current_customer
	    @order = Order.new
	end

	def create
		@order = Order.new(params[:Order])
	 if @oder.save
		redirect_to customers_orders_confirm_path
	 end
	end

	def confirm
		@customer = Customer.new(customer_params)
	end

	def thanks
	end
end
