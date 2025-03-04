class CreateRescares < ActiveRecord::Migration[7.0]
  def change
    create_table :rescares do |t|
      t.string :name
      t.string :services
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.text :counties_served

      t.timestamps
    end
  end
end
