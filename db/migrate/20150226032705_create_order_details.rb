class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.decimal :tax

      t.timestamps
    end
  end
end
