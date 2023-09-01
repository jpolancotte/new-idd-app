class CreateCompanyTaxonomies < ActiveRecord::Migration[7.0]
  def change
    create_table :company_taxonomies do |t|
      t.references :npi_company, null: false, foreign_key: true
      t.references :taxonomy, null: false, foreign_key: true
      t.string :state_iso
      t.string :license
      t.boolean :primary

      t.timestamps
    end
  end
end
