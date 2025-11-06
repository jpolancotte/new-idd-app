class AddMedDeliveryToDeals < ActiveRecord::Migration[7.0]
  def change
    add_column :deals, :med_delivery_to, :string
  end
end
