class Event < ApplicationRecord
    belongs_to :deal, optional: true
end
