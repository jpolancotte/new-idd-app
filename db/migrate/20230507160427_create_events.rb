class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_type
      t.integer :object_id
      t.string :event_id
      t.string :occured_at
      t.string :property_name
      t.string :property_value

      t.timestamps
    end
  end
end
