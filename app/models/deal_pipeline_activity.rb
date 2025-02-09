class DealPipelineActivity < ApplicationRecord
  belongs_to :deal
  belongs_to :pipeline_activity
end
