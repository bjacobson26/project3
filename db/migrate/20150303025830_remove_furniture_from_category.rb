class RemoveFurnitureFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :furniture, :string
  end
end
