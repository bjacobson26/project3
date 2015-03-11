class CategoriesController < ApplicationController
  
  def furnishings
    @furnishings = Product.where(category_id: 4)
  end

  def paintings
    @paintings = Product.where(category_id: 5)
  end

  def sculptures
    @sculptures = Product.where(category_id: 6)
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
