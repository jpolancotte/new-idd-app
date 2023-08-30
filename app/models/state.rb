class State < ApplicationRecord
    validates :name, :presence => true, :uniqueness => true
    
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
end
