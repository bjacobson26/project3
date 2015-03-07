class AddProductToProductImages < ActiveRecord::Migration
  def change
    add_reference :product_images, :product, index: true
  end
end
