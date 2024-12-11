class CreateTteServicingPharmacies < ActiveRecord::Migration[7.0]
  def change
    create_table :tte_servicing_pharmacies do |t|
      t.string :name
      t.string :pharmid
      t.string :street1
      t.string :street2
      t.string :city
      t.references :state, null: false, foreign_key: true
      t.string :zip
      t.string :phone

      t.timestamps
    end
  end
end
