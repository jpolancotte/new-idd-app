class AddFieldsToHsContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :hs_contacts, :job_title, :string
    add_column :hs_contacts, :contact_city, :string
    add_column :hs_contacts, :contact_state, :string
    add_column :hs_contacts, :company_address, :string
    add_column :hs_contacts, :company_city, :string
    add_column :hs_contacts, :company_state, :string
    add_column :hs_contacts, :company_postal_code, :string
  end
end
