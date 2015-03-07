class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def new
    @product = Product.new
    @product.product_images.build
    @product.product_images.build
    @product.product_images.build

    # if current_user_admin 
    #   @product = Product.new
    # else
    #   redirect_to root_path            
    # end
  end

  def create
    if current_user.admin == true
      # no need for it to be an instance variable (have an @), b/c we're not rendering a view
      product = Product.new(params.require(:product).permit(:name, :category_id, :unit_price, :height, :width, :depth, :weight, :material, :is_discontinued, :in_stock, :is_taxable, :avatar, product_images_attributes: [:id, :image]))
      product.save
      redirect_to admin_path
      # product.user = current_user_admin
    else
      redirect_to root_path
    end
      # if product.save
      #     redirect_to new_product_entry_path(product_id: product.id)
      #   else 
      #     raise "else called"
      #     render 'new'
      # end
  end

  def show  
  	@product = Product.find(params[:id])
  end


  def edit
  end

  def product_params
    params.require(:product).permit(:avatar, product_images_attributes: [:id, :image])
  end
end
