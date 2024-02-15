class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :city
      t.references :state, null: false, foreign_key: true
      t.string :zip
      t.string :county
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
