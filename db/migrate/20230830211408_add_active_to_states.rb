class AddActiveToStates < ActiveRecord::Migration[7.0]
  def change
    add_column :states, :active, :boolean, default: false
  end
end
