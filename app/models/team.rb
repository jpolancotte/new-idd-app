class Team < ApplicationRecord
    has_many :deals, dependent: :destroy
    has_many :events, dependent: :destroy
end
