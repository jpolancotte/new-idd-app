class HsCompany < ApplicationRecord
    validates :hs_number, presence: true, uniqueness: true

    geocoded_by :get_address
    after_validation :geocode, if: ->(obj){ obj.city.present? and obj.city_changed? }
    
    #after_validation :geocode, if: ->(obj){ obj.latitude.nil? }
    
    def get_address
    "#{address}, #{city}, #{state}, #{zip}"
    end
end
