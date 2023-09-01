class NpiAddress < ApplicationRecord
  belongs_to :npi_company
  belongs_to :state
end
