class AddHuspotCompanyId < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :hubspot_number, :string
  end
end
