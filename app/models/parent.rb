class Parent < ApplicationRecord
    has_many :npi_companies, dependent: :destroy
    has_many :states, -> { distinct }, through: :npi_companies
end


