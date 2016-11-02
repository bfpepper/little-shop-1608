class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(title: params[:category_name])
    @trips = @category.trips
  end
end
