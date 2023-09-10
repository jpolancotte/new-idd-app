class NpiCompany < ApplicationRecord
    validates :name, :presence => true
    validates :number, :presence => true, :uniqueness => true
    has_many :npi_addresses, dependent: :destroy
    has_many :identifiers, dependent: :destroy
    has_many :company_taxonomies, dependent: :destroy
    has_many :taxonomies, through: :company_taxonomies
    belongs_to :state, optional: true
    belongs_to :parent, optional: true

    geocoded_by :get_address
    after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address? }
          
    def get_address
        "#{address}, #{city}, #{state.iso} #{postal_code}"
    end

end
