namespace :db do
    namespace :seed do
      desc "convert string to lower cas underscore"
      task api_deal: :environment do
        
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


        require 'hubspot-api-client'

        api_client = Hubspot::Client.new(access_token: 'pat-na1-3903dc60-2e81-45e5-b9cd-d8a80007be28')

        api_response = api_client.crm.deals.basic_api.get_by_id(
          deal_id: 13291859357, 
          properties: ["hubspot_owner_id, dealname, chain, dealstage, state, tte_servicing_pharmacy, 
                       total_residential_individuals, probability_of_close, go_live_date, incumbent_pharmacy, delivery_type, comments, pipeline_date"], 
          archived: false
        )

        properties = api_response.properties



        # puts api_response


        
        
        
      end
    end
  end