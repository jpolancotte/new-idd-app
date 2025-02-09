class DealPipelineActivity < ApplicationRecord
  belongs_to :deal
  belongs_to :pipeline_activity

  validates :deal_id, uniqueness: {scope: :pipeline_activity_id}
end
