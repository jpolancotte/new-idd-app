class AddRemoveToDeals < ActiveRecord::Migration[7.0]
  def change
    add_column :deals, :remove, :boolean
  end
end
