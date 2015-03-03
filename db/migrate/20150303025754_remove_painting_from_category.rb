class RemovePaintingFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :painting, :string
  end
end
