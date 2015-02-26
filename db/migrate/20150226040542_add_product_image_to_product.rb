class AddProductImageToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :product_image, index: true
  end
end
