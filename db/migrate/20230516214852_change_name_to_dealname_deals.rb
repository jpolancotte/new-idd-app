class ChangeNameToDealnameDeals < ActiveRecord::Migration[7.0]
  def change
    rename_column :deals, :name, :dealname
  end
end
