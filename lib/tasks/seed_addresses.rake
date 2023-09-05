namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task addresses: :environment do
            locations=NpiAddress.where(address_purpose: "LOCATION")
            locations.first(3).each do |loc|
              NpiCompany.find(loc.npi_company_id).update(address: loc.address, city: loc.city, state_id: loc.state_id, postal_code: loc.postal_code, main_phone_number: loc.telephone_number)
            end
       end
     end
  end