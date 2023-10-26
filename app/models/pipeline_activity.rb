class PipelineActivity < ApplicationRecord
    has_many :events, dependent: :destroy

    def name
      end_date
    end
    
end
