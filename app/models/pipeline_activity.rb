class PipelineActivity < ApplicationRecord
    has_many :events, dependent: :destroy
    has_many :deals, through: events

    def name
      end_date
    end
    
end
