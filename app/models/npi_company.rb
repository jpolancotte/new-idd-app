class NpiCompany < ApplicationRecord
    validates :name, :presence => true
    validates :number, :presence => true, :uniqueness => true
    has_many :npi_addresses, dependent: :destroy
    has_many :identifiers, dependent: :destroy
    has_many :company_taxonomies, dependent: :destroy
    has_many :taxonomies, through: :company_taxonomies
end
