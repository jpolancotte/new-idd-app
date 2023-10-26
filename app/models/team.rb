class Team < ApplicationRecord
    has_many :deals, dependent: :destroy
    has_many :events, through: :deals
end
