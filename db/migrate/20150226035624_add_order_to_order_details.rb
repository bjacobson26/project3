class AddOrderToOrderDetails < ActiveRecord::Migration
  def change
    add_reference :order_details, :order, index: true
  end
end
