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
        require 'date'


        require 'hubspot-api-client'       

        api_client = Hubspot::Client.new(access_token: 'pat-na1-3903dc60-2e81-45e5-b9cd-d8a80007be28')

        api_response = api_client.crm.deals.basic_api.get_by_id(
          deal_id: 13356947541, 
          properties: ["hubspot_owner_id, dealname, chain, dealstage, state, tte_servicing_pharmacy, 
                       total_residential_individuals, probability_of_close, go_live_date, incumbent_pharmacy, delivery_type, 
                       comments, pipeline_date, forecasted_individuals"], 
          archived: false
        )
      
       pp prop=api_response.properties      

      #  puts prop["hubspot_owner_id"]
       team_id=Team.find_by_hs_deal_owner_number(prop["hubspot_owner_id"]).id
      #  puts team_id

       deal_stage_id=DealStage.find_by_number(prop["dealstage"]).id
      #  puts deal_stage_id

      # pipeline_date = Date.parse(prop["pipeline_date"])
      # puts a.strftime("%m/%d/%Y")

      # puts a = Date.parse(prop["hs_lastmodifieddate"])
      # puts a.strftime("%m/%d/%Y")

      #  Deal.create(
      #   team_id: team_id,
      #   dealname: prop["dealname"],
      #   chain: prop["chain"],
      #   deal_stage_id: deal_stage_id,
      #   state: prop["state"],
      #   tte_servicing_pharmacy: prop["tte_servicing_pharmacy"],
      #   total_residential_individuals: prop["total_residential_individuals"],
      #   probability_of_close: prop["probability_of_close"],
      #   go_live_date: prop["go_live_date"],
      #   incumbent_pharmacy: prop["incumbent_pharmacy"],
      #   delivery_type: prop["delivery_type"],
      #   comments: prop["comments"],
      #   pipeline_date: prop["pipeline_date"],
      #   forecasted_individuals: prop["forecasted_individuals"],
      #   objectid: prop["hs_object_id"]
      #  )


      #  puts prop["dealname"]
      #  puts prop["chain"]
      #  puts prop["dealstage"]
      #  puts prop["state"]
      #  puts prop["tte_servicing_pharmacy"]
      #  puts prop["total_residential_individuals"]
      #  puts prop["probability_of_close"]
      #  puts prop["go_live_date"]
      #  puts prop["incumbent_pharmacy"]
      #  puts prop["delivery_type"]
      #  puts prop["comments"]
      #  puts prop["pipeline_date"]  # 2023-05-16 fix format
      #  puts prop["forecasted_individuals"] 
       
       
      #  puts prop["hs_lastmodifieddate"] # 2023-05-19T19:37:43.323Z fix format
      #  puts prop["hs_object_id"]
      
       
       
      
       
      
      





        



        # puts api_response


        
        
        
      end
    end
  end