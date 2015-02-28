class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
