class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :unit_price
      t.integer :quantity
      t.boolean :in_stock
      t.text :description
      t.float :height
      t.float :weight
      t.float :width
      t.float :depth
      t.string :material

      t.timestamps
    end
  end
end
