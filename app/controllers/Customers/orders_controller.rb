class Customers::OrdersController < ApplicationController
	before_action :authenticate_customer!
	def index
		@customer = current_customer
		@orders = @customer.orders.page(params[:page])
	end

	def show
        @customer = current_customer
        @order = Order.find(params[:id])
        @total_price = @order.price + @order.freight
        @product_orders = ProductOrder.where(params[:@order])
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
