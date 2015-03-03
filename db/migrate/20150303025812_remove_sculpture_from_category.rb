class RemoveSculptureFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :sculpture, :string
  end
end
