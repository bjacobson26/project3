class AddIndoorToProduct < ActiveRecord::Migration
  def change
    add_column :products, :indoor, :boolean
  end
end
