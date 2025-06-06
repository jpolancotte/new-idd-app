class HsCompany < ApplicationRecord
    validates :hs_number, presence: true, uniqueness: true

    geocoded_by :get_address
    after_validation :geocode, if: ->(obj){ obj.company_city.present? and obj.company_city_changed? }
    
    #after_validation :geocode, if: ->(obj){ obj.latitude.nil? }
    
    def get_address
    "#{company_address}, #{company_city}, #{company_state}, #{company_zip}"
    end
end
