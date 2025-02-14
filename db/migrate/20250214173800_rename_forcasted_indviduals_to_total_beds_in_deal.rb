class RenameForcastedIndvidualsToTotalBedsInDeal < ActiveRecord::Migration[7.0]
  def change
    rename_column :deals, :forecasted_individuals, :total_beds
  end
end
