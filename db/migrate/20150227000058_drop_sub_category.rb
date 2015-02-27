class DropSubCategory < ActiveRecord::Migration
  def up
  	drop_table :sub_categories
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
