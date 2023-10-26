class CreatePipelineActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :pipeline_activities do |t|
      t.date :end_date
      t.date :start_date
      t.integer :week_number

      t.timestamps
    end
  end
end
