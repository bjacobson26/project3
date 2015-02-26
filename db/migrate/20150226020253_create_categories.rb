class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :painting
      t.string :sculpture
      t.string :furniture

      t.timestamps
    end
  end
end
