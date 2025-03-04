class PharmericaPharmacy < ApplicationRecord

    geocoded_by :get_address

    after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
    
    #after_validation :geocode, if: ->(obj){ obj.latitude.nil? }
    
    def get_address
      [address, city, state, zip].compact.join(', ')
    end
    
end
