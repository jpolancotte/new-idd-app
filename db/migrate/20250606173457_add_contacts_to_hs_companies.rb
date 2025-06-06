class AddContactsToHsCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :hs_companies, :contacts, :integer
  end
end
