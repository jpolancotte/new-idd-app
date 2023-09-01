class CreateIdentifiers < ActiveRecord::Migration[7.0]
  def change
    create_table :identifiers do |t|
      t.references :npi_company, null: false, foreign_key: true
      t.string :code
      t.string :desc
      t.string :issuer
      t.string :number
      t.string :state

      t.timestamps
    end
  end
end
