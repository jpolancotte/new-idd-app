class CreateTtePharmacies < ActiveRecord::Migration[7.0]
  def change
    create_table :tte_pharmacies do |t|
      t.string :name
      t.string :state
      t.string :pharmid

      t.timestamps
    end
  end
end
