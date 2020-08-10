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
	    # p @addressess
	end

	def create
		@order = current_customer.orders.new(order_params)
		@order.save
		if @order.address != current_customer.address && AddressList.find_by(address: @order.address).nil?
		     address_list = AddressList.new
		     address_list.postal_code = @order.postal_code
		     address_list.address = @order.address
		     address_list.name = @order.name
		     address_list.customer_id = current_customer.id
		     address_list.save
		end
		if @order.save
		@cart_products = current_customer.cart_products.all
		 @cart_products.each do |cart_product|
			@order_products = @order.product_orders.new
			@order_products.product_id = cart_product.product.id
			@order_products.status = "着手不可"
			@order_products.price = cart_product.product.price * 1.08
			@order_products.quantity = cart_product.quantity
			@order_products.save
			current_customer.cart_products.destroy_all
	     end
	     redirect_to  customers_orders_thanks_path
	 	else
	    	@customer = current_customer
	    	@addressess = current_customer.address_lists
	 		render :new
	 	end
	 end

	def confirm
		@order = Order.new(order_params)
		@cart_products = current_customer.cart_products
		@freight = 800
		@total_price = 0
		@cart_products.each do |cart_product|
			@total_price += cart_product.product.price * cart_product.quantity * 1.08
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
		params.require(:order).permit(:customer_id, :name, :postal_code, :address, :how_to_pay, :status, :price, :freight)
	end
	def cart_product_params
		params.require(:cart_product).permit(:product_id, :quantity, :customer_id)
	end
end