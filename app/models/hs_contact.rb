class HsContact < ApplicationRecord
    validates :hs_number, presence: true, uniqueness: true

    geocoded_by :get_address
    after_validation :geocode, if: ->(obj){ obj.contact_city.present? and obj.contact_city_changed? }
    
    #after_validation :geocode, if: ->(obj){ obj.latitude.nil? }
    
    def get_address
    "#{contact_city}, #{contact_state}"
    end

end
