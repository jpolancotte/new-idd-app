class AddParentToNpiCompanies < ActiveRecord::Migration[7.0]
  def change
    add_reference :npi_companies, :parent, null: true, foreign_key: true
  end
end
