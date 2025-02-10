class PipelineActivity < ApplicationRecord
  has_many :events, dependent: :destroy

  has_many :deal_pipeline_activities, dependent: :destroy
  has_many :deals, through: :deal_pipeline_activities
  # has_many :deals, -> { distinct }, through: :deal_pipeline_activities
   
  def name
    end_date
  end
    
end
