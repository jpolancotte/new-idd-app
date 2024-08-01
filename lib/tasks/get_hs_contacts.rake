namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task get_hs_contacts: :environment do

            require 'hubspot-api-client'

           puts api_client = Hubspot::Client.new(access_token: ENV["HUBSPOT_API_KEY"])

           contacts = api_client.crm.contacts.basic_api.get_page
           pp contacts.results
            
       end
     end
  end