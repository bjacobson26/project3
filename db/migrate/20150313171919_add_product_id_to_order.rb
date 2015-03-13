class AddProductIdToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :product, index: true
  end
end
