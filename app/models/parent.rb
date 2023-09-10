class Parent < ApplicationRecord
    has_many :npi_companies, dependent: :destroy
end
