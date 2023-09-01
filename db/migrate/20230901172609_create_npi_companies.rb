class CreateNpiCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :npi_companies do |t|
      t.string :name
      t.string :number
      t.date :enumeration_date
      t.date :last_updated
      t.string :subpart
      t.string :status

      t.timestamps
    end
  end
end
