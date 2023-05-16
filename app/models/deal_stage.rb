class DealStage < ApplicationRecord
    has_many :deals, dependent: :destroy
end
