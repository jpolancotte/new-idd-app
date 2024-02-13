class Customer < ApplicationRecord
    require 'csv'
    validates :facid, :presence => true, :uniqueness => true

    def self.import(file)
        # data = CSV.foreach(file.path, headers: true).map{ |row| row.to_h }
        
        datas = CSV.foreach(file.path, headers: true).map{ |row| 
          {
           name: row["FacName"],
           tte_pharmacy_id: TtePharmacy.find_by_pharmid(row["PharmID"]).id,
           fac_number: row["FacID"],
           street1: row["FacStreet1"],
           street2: row["FacStreet2"],
           city_id: City.find_or_create_by(name: row["FacCity"], state: State.find_by_iso(row["FacState"])).id,
           state_id: State.find_by_iso(row["FacState"]).id,
           zip: row["FacZip"],
           fac_admin_phone: row["FacAdminPhone"],
           last_customer_update_id: LastCustomerUpdate.find_or_create_by(name: row["LastCustomerUpdate"]).id
          }
        }
        
        result = Customer.upsert_all(
                              datas, unique_by: :facid
                            )                
            puts result
    
    end

 
end
