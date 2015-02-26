class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.decimal :shipping_price
      t.decimal :subtotal
      t.decimal :total
      t.boolean :is_completed

      t.timestamps
    end
  end
end
