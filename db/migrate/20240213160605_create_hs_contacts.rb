class CreateHsContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :hs_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :hs_number
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :tte_customer
      t.string :contact_owner
      t.string :company_type
      t.string :company_name
      t.string :primay_identifier
      t.decimal :latitude, precision: 13, scale: 9
      t.decimal :longitude, precision: 13, scale: 9

      t.timestamps
    end
  end
end
