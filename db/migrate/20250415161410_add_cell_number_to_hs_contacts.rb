class AddCellNumberToHsContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :hs_contacts, :cell_phone, :string
  end
end
