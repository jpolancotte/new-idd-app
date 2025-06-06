class CreateHsCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :hs_companies do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :primary_identifier
      t.string :hs_number
      t.string :website
      t.decimal :latitude, precision: 13, scale: 9
      t.decimal :longitude, precision: 13, scale: 9

      t.timestamps
    end
  end
end
