namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task addresses: :environment do
            ids=NpiCompany.where(address: [nil, ""]).pluck(:id).first(3)
            adds=NpiAddress.where(npi_company_id: ids).where(address_purpose: "LOCATION")

            adds.each do |loc|
                NpiCompany.find(loc.npi_company_id).update(address: loc.address, city: loc.city, state_id: loc.state_id, postal_code: loc.postal_code, main_phone_number: loc.telephone_number)
            end
       end
     end
  end