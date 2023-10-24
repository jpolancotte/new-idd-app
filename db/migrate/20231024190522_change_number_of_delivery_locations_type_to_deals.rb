class ChangeNumberOfDeliveryLocationsTypeToDeals < ActiveRecord::Migration[7.0]
  def change
    change_column :deals, :number_of_delivery_locations, 'integer USING CAST(number_of_delivery_locations AS integer)'
  end
end

