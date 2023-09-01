class Taxonomy < ApplicationRecord
    has_many :company_taxonomies, dependent: :destroy
    has_many :npi_companies, through: :company_taxonomies
end
