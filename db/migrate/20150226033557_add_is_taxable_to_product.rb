class AddIsTaxableToProduct < ActiveRecord::Migration
  def change
    add_column :products, :is_taxable, :boolean
  end
end
