class AddTrackingNumberToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :tracking_number, :string
  end
end
