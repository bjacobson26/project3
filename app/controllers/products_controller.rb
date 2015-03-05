class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def new
  end

  def show  
  	@product = Product.find(params[:id])
  end


  def edit
  end
end
