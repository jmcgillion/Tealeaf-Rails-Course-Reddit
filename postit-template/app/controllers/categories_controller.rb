class CategoriesController < ApplicationController
	before_action :require_user, only: [:new, :create]
  def show
  	@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = "A new category has been created."
			redirect_to root_path
		elsif
			render :new
		end
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end
end


