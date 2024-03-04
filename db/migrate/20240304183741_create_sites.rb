class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.references :organization, null: false, foreign_key: true
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.integer :beds
      t.string :category
      t.string :service_type
      t.string :total_bed_count
      t.string :total_resident_count
      t.boolean :icf_idd
      t.string :license_number

      t.timestamps
    end
  end
end
