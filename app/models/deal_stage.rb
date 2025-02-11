class DealStage < ApplicationRecord
    validates :name, :number, presence: true, uniqueness: true
    has_many :deals, dependent: :destroy
end
