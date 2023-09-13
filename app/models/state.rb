class State < ApplicationRecord
    validates :name, :presence => true, :uniqueness => true
    has_many :npi_addresses, dependent: :destroy
    has_many :npi_companies, dependent: :destroy   
    has_many :parents, through: :npi_companies
    
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
end
