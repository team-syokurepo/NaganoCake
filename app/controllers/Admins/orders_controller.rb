class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@customer_id = params[:customer_id]
		if @customer_id.blank?
			@orders = Order.page(params[:page])
		else
			@customer = Customer.with_deleted.find(@customer_id)
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
		if @order.status == "入金確認"
			product_orders = ProductOrder.where(order_id: @order.id)
			product_orders.each do |product_order|
				product_order.status = "製作待ち"
				product_order.update(status: product_order.status)
			end
		end
		redirect_to request.referer

	end

	def product_update
		product_order = ProductOrder.find(params[:id])
		product_order.update(product_order_params)
		order = Order.find(product_order.order_id)
		if product_order.status == "製作中"
			order.status = "製作中"
			order.update(status: order.status)
		end
		if product_order.status == "製作完了"
			product_orders = ProductOrder.where(order_id: order.id)
			all_status = true
			product_orders.each do |productorder|
				if productorder.status != "製作完了"
					all_status = false
					break
				end
			end
			if all_status == true
				order.status = "発送準備中"
				order.update(status: order.status)
			end
		end

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
