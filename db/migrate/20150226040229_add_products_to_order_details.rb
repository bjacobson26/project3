class AddProductsToOrderDetails < ActiveRecord::Migration
  def change
    add_reference :order_details, :product, index: true
  end
end
