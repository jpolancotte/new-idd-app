class Parent < ApplicationRecord
    has_many :npi_companies, dependent: :destroy
    has_many :states, -> { distinct }, through: :npi_companies

    scope :top_1000, -> { joins(:npi_companies).group("parents.id").order("count(parents.id) DESC").limit(1000) }
   
end


