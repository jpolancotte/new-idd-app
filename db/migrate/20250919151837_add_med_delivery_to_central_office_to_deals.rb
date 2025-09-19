class AddMedDeliveryToCentralOfficeToDeals < ActiveRecord::Migration[7.0]
  def change
    add_column :deals, :med_delivery_to_cenral_office, :string
  end
end
