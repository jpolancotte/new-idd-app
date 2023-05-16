class Team < ApplicationRecord
    has_many :deals, dependent: :destroy
end
