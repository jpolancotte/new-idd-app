class ChangePipelineDateFromStringToDeals < ActiveRecord::Migration[7.0]
  def change
    change_column :deals, :pipeline_date, :date
  end
end
