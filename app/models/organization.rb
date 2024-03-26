class Organization < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :locations, dependent: :destroy
    has_many :sites, dependent: :destroy
end
