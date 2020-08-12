class Admins::CategoriesController < ApplicationController
	before_action :authenticate_admin!
	def index
		@categories = Category.page(params[:page]).per(5)
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if  @category.save
			redirect_to request.referer,notice: "ジャンル:#{@category.name}が追加されました"
		else
			@categories = Category.page(params[:page]).per(5)
			render :index
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			redirect_to admins_categories_path,notice: "変更されました"
		else
			render :edit
		end
	end

	def destroy
		category = Category.find(params[:id])
		category.destroy
		redirect_to admins_categories_path,notice: "#{category.name}が削除されました"
	end

private
	def category_params
		params.require(:category).permit(:name, :valid_flag)
	end

end
