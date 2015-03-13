class ProductImagesController < ApplicationController
  def index
  	@product_images = ProductImage.all
  end

  def new
    if current_user_admin
  	 @product_image = ProductImage.new
    else
      redirect_to root_path
    end
  end

  def create
    if current_user_admin
  	 product_image = ProductImage.create(product_image_params)
  	else
  		redirect_to root_path
    end
  end 

  def show
  end

  def edit
  end

  def destory
    product_image = product_image.where(id: params[:id]).first
    product_image.destroy
  end

  private 
    def product_image_params
    params.require(:product_image).permit(:image, :photo_date)
  end

end
