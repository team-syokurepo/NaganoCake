class Customers::OrdersController < ApplicationController
	def index
		@customer = current_customer
		@orders = @customer.orders.page(params[:page])
	end

	def show
        @customer = current_customer
        @order = Order.find(params[:id])
        @total_price = @order.price + @order.freight
	end

	def new
	    @customer = current_customer
	    @order = Order.new
	    @addressess = current_customer.address_lists
	    p @addressess
	end

	def create
		@order = Order.new(params[:Order])
	 end

	def confirm
		@order = Order.new(order_params)
		@cart_products = current_customer.cart_products
		@freight = 800
		@total_price = 0
		@cart_products.each do |cart_product|
			@total_price += cart_product.product.price * cart_product.quantity
		end
		if request.post? then
		if params[:order][:address_option] == "A" then
			@order.postal_code = current_customer.postal_code
			@order.address = current_customer.address
			@order.name = current_customer.first_name + current_customer.last_name
		elsif params[:order][:address_option] == "B" then
			id = current_customer.address_lists.find_by(id: params[:order][:addressparams])
			@order.postal_code = id.postal_code
			@order.address = id.address
			@order.name = id.name

	end
end
end


	def thanks
	end

	private
	def order_params
		params.require(:order).permit(:customer_id, :name, :postal_code, :address, :how_to_pay, :status, :price)
	end
	def cart_product_params
		params.require(:cart_product).permit(:product_id, :quantity, :customer_id)
	end
end