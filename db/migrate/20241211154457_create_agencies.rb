class CreateAgencies < ActiveRecord::Migration[7.0]
  def change
    create_table :agencies do |t|
      t.string :name
      t.references :company, null: false, foreign_key: true
      t.string :street1
      t.string :street2
      t.string :city
      t.references :state, null: false, foreign_key: true
      t.string :zip
      t.string :license_number
      t.string :license_type
      t.string :county
      t.string :phone
      t.string :license_status
      t.integer :capacity
      t.string :licensing_authority

      t.timestamps
    end
  end
end
