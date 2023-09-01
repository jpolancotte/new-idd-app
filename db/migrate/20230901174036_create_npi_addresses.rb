class CreateNpiAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :npi_addresses do |t|
      t.references :npi_company, null: false, foreign_key: true
      t.string :address_purpose
      t.string :address
      t.string :city
      t.references :state, null: false, foreign_key: true
      t.string :postal_code
      t.string :telephone_number
      t.decimal :latitude, precision: 13, scale: 9
      t.decimal :longitude, precision: 13, scale: 9

      t.timestamps
    end
  end
end
