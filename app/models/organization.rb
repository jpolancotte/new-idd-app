class Organization < ApplicationRecord
    validates :name, :presence => true
    has_many :locations, dependent: :destroy
end
