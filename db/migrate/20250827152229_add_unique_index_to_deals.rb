class AddUniqueIndexToDeals < ActiveRecord::Migration[7.0]
  def change
    add_index :deals, :objectid, unique: true
  end
end
