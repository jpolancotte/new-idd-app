class CompanyTaxonomy < ApplicationRecord
  belongs_to :npi_company
  belongs_to :taxonomy
end
