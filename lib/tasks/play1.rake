namespace :db do
    namespace :seed do
      desc "convert string to lower cas underscore"
      task play1: :environment do
        
        require 'open-uri'
        require 'date'
        require 'uri'
        require 'net/http'
        require 'openssl'
        require 'json'
        require 'csv'
        require 'pp'
        
        require "csv"
        require 'nokogiri'
        require 'httparty'
        require 'json' 
        require 'geocoder'


        require 'hubspot-api-client' 
          api_client = Hubspot::Client.new(access_token: 'pat-na1-54430935-b008-4993-8a0f-c0af27fe08f0')

          api_response = api_client.crm.deals.basic_api.get_by_id(
            deal_id: 15127774337, 
            properties: ["hubspot_owner_id, dealname, chain, dealstage, state, tte_servicing_pharmacy, 
                        total_residential_individuals, probability_of_close, go_live_date, incumbent_pharmacy, delivery_type, 
                        comments, pipeline_date, forecasted_individuals"], 
            archived: false
          )
          
          deal=api_response.properties 

          puts deal

        # CSV.open("csv/support_inc_co_results1.csv", "a") do |fl|

        #   CSV.foreach("csv/support_inc_co_results.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row| 
            
        #     full = "#{row[0]} #{row[1]} #{row[2]}"  
          
        #     results = Geocoder.search(full)  
            
        #     # puts results
        #     lat = results.first.coordinates[0]
        #     lon = results.first.coordinates[1]

        #     puts lat 
        #     puts lon

        #     fl << row.values_at(*row.headers) + [lat] + [lon]

        #   end
        # end


                   
      
       
        
        
      end
    end
  end