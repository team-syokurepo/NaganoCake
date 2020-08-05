class Customers::AddressListsController < ApplicationController

	def create
	    @address_list = AddressList.new(address_list_params)
	    @address_list.customer_id = current_customer.id
	    if  @address_list.save
	        redirect_to  request.referer
	    else
	    	@address_lists = AddressList.all
	    	render 'index'
		end
	end

	def index
		@address_lists = current_customer.address_lists
    	@address_list = AddressList.new
    	@address_list_find = current_customer.id
	end

	def edit
		@address_list =  AddressList.find(params[:id])
	end

	def update
		@address_list = AddressList.find(params[:id])
		if @address_list.update(address_list_params)
           redirect_to customers_address_lists_path(@address_list), notice: "You have updated book successfully."
        else
           render "edit"
        end
	end

	def destroy
		@address_list = AddressList.find(params[:id])
		@address_list.destroy
		redirect_to customers_address_lists_path(@address_list)
	end


	private
	def address_list_params
		params.require(:address_list).permit(:customer_id, :name, :postal_code, :address)
	end

end
