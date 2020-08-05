class Admins::CategoriesController < ApplicationController
	def index
		@categories = Category.page(params[:page]).per(5)
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if  @category.save
			redirect_to request.referer
		else
			@categories = Category.all
			render :index
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		category = Category.find(params[:id])
		if category.update(category_params)
			redirect_to admins_categories_path
		else
			@category = Category.find(params[:id])
			render :edit
		end
	end

	def destroy
		category = Category.find(params[:id])
		category.destroy
		redirect_to admins_categories_path
	end

private
	def category_params
		params.require(:category).permit(:name, :valid_flag)
	end

end
