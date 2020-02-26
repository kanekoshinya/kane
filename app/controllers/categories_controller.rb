class CategoriesController < ApplicationController

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      redirect_to new_category_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
