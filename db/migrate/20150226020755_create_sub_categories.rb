class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.boolean :indoor

      t.timestamps
    end
  end
end
