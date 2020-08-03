class Admins::CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def create
		category = Category.new(category_params)
		category.save
		redirect_to fallback_location
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		category = Category.find(params[:id])
		category.update(category_params)
		redirect_to admins_categories
	end

private
	def category_params
		params.require(:category).permit(:name, :valid_flag)
	end

end
