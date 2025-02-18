class Event < ApplicationRecord
    belongs_to :deal, optional: true
    belongs_to :pipeline_activity, optional: true    
end
