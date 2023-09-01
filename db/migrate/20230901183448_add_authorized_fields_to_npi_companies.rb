class AddAuthorizedFieldsToNpiCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :npi_companies, :first_name, :string
    add_column :npi_companies, :last_name, :string
    add_column :npi_companies, :telephone_number, :string
    add_column :npi_companies, :position, :string
    add_column :npi_companies, :prefix, :string
    add_column :npi_companies, :suffix, :string    
  end
end
