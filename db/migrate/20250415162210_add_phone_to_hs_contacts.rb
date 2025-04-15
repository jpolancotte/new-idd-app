class AddPhoneToHsContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :hs_contacts, :phone, :string
  end
end
