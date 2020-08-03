class Customers::CustomersController < ApplicationController

	def show
		@customer = current_customer
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
	end

	def destroy
	end

	def quit
	end

	def quit_update
		# Customer.find_by(id: params[:id], customer_id: params[:customer_id]).destroy
		customer = current_customer
		byebug
		customer.destroy
		customer.deleted_at
		redirect_to '/'
	end

	private
      def customer_params
  	    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number)
      end
end
