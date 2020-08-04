class Admins::CustomersController < ApplicationController
 # before_action customer_admin, only: [:index, :customer_restore]

	def index
		@customers = Customer.with_deleted
	end

	def show
		
	end

	def edit
		
	end

	def update
		
	end

private
    def customer_admin
       @customers = Customer.with_deleted
       # if  current_customer.admin == false
       #     redirect_to /
       # else
       #     render action: "index"
       # end
    end

end
