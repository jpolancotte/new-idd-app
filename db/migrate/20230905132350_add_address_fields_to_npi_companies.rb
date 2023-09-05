class AddAddressFieldsToNpiCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :npi_companies, :address, :string
    add_column :npi_companies, :city, :string
    add_reference :npi_companies, :state, null: true, foreign_key: true
    add_column :npi_companies, :postal_code, :string
    add_column :npi_companies, :main_phone_number, :string
    add_column :npi_companies, :latitude, :decimal, precision: 13, scale: 9
    add_column :npi_companies, :longitude, :decimal, precision: 13, scale: 9
  end
end
