class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :facid
      t.string :pharmid
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :fac_admin_phone

      t.index :facid, unique: true	 

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
