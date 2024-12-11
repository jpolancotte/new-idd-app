class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :facid
      t.references :tte_servicing_pharmacy, null: false, foreign_key: true
      t.string :street1
      t.string :street2
      t.string :city
      t.references :state, null: false, foreign_key: true
      t.string :zip
      t.string :admin_phone

      t.timestamps
    end
  end
end
