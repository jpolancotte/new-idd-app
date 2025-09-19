class RenameMedDeliveryToCenralOfficeToMedDeliveryToCentralOfficeDeals < ActiveRecord::Migration[7.0]
  def change
    rename_column :deals, :med_delivery_to_cenral_office, :med_delivery_to_central_office
  end
end
