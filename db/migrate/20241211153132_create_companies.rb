class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.references :state, null: false, foreign_key: true
      t.string :street1
      t.string :street2
      t.string :city
      t.string :zip
      t.string :website
      t.string :phone

      t.timestamps
    end
  end
end
