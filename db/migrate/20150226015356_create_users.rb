class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :country
      t.string :phone
      t.string :email
      t.string :password_digest
      t.boolean :admin

      t.timestamps
    end
  end
end
