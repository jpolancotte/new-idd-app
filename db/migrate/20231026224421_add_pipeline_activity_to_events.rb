class AddPipelineActivityToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :pipeline_activity, null: true, foreign_key: true
  end
end
