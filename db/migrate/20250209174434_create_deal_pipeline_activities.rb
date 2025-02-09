class CreateDealPipelineActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :deal_pipeline_activities do |t|
      t.references :deal, null: false, foreign_key: true
      t.references :pipeline_activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
