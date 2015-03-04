class CategoriesController < ApplicationController
  
  def furnishings
    @furnishings = Product.where(category_id: 1)
  end

  def paintings
    @paintings = Product.where(category_id: 2)
  end

  def sculptures
    @sculptures = Product.where(category_id: 3) 
  end

  # def index
  # end

  # def new
  # end

  # def show

  # end

  # def edit
  # end

end
