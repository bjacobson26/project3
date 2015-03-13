class ProductsController < ApplicationController
  def index
  	@products = Product.all
    @product_images = ProductImage.all
  end

  def new
    @product = Product.new
    @product.product_images.build
    @product.product_images.build
    @product.product_images.build
  end

  def create
    if current_user.admin == true
      product = Product.new(params.require(:product).permit(:name, :category_id, :description, :unit_price, :height, :width, :depth, :weight, :material, :is_discontinued, :in_stock, :is_taxable, :avatar, product_images_attributes: [:id, :image]))
      product.save
      redirect_to admin_path
    else
      redirect_to root_path
    end
  end

  def show  
  	@product = Product.find(params[:id])
  end


  def edit
    @product = Product.find(params[:id])
    (3- @product.product_images.count).times do 
      @product.product_images.build
    end
  end

  def update
    puts "========================================================================"
    puts "update action"
    puts "========================================================================"
    if current_user.admin == true
    @product = Product.find(params[:id])
    @product.update_attributes(params.require(:product).permit(:name, :category_id, :description, :unit_price, :height, :width, :depth, :weight, :material, :is_discontinued, :in_stock, :is_taxable, :avatar, product_images_attributes: [:id, :image]))
      redirect_to product_path
    else 
      render 'edit'
    end
  end

  def product_params
    params.require(:product).permit(:avatar, product_images_attributes: [:id, :image])
  end
end
