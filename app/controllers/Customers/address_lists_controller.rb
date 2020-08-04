class Customers::AddressListsController < ApplicationController

	def create
    	@address_list = AddressList.new(address_list_params)
	    @address_list.customers_id = current_customer.id
	    if @address_list.save
	      redirect_to customers_address_lists _path, notice: "You have created book successfully."
	    else
	      @address_lists = AddressList.all
	      render 'index'
    end
	end

	def index
	    @address_lists = AddressList.all
    	@address_list = AddressList.new
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end


	private
	def address_lists_params
		params.require(:address_lists).permit(:customers_id, :name, :postal_code, :address)
	end

end
