class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def new
  end

  def show	
    @furnishings = Category.where(:id == 1)
    @paintings = Category.where(:id == 2)
    @sculptures = Category.where(:id == 3)
  end

  def edit
  end
end
