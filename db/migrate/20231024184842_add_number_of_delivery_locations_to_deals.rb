class AddNumberOfDeliveryLocationsToDeals < ActiveRecord::Migration[7.0]
  def change
    add_column :deals, :number_of_delivery_locations, :string
  end
end
