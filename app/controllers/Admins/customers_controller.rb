class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!
 # before_action customer_admin, only: [:index, :customer_restore]

	def index
		@customers = Customer.with_deleted.page(params[:page]).reverse_order
	end

	def show
		@customer = Customer.with_deleted.find(params[:id])
	end

	def edit
		@customer = Customer.with_deleted.find(params[:id])
	end

	def update
		@customer = Customer.with_deleted.find(params[:id])
       if @customer.update(customer_params)
        redirect_to admins_customer_path(@customer)
       else
        render :edit
       end
	end

  private
    def customer_admin
       @customers = Customer.with_deleted

    end

    def customer_params
	  params.require(:customer).permit(:deleted_at, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number)
	end

end
