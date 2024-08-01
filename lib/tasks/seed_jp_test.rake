namespace :db do
    namespace :seed do
      desc "convert string to lower cas underscore"
      task jp_test: :environment do
        
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

        # api_client = Hubspot::Client.new(access_token: ENV["HUBSPOT_API_KEY"])

        # api_response = api_client.crm.deals.basic_api.get_page(  
        # limit: 100, after: 100,   
        # properties: ["hubspot_owner_id, dealname, pipeline_date, comments,  
        #             delivery_type, incumbent_pharmacy, go_live_date, probability_of_close,  
        #             total_residential_individuals, tte_servicing_pharmacy, state, dealstage, chain, forecasted_individuals"], 
        # archived: false)
        # deals = api_response.results


        # pp deals.size


        api_client = Hubspot::Client.new(access_token: ENV["HUBSPOT_API_KEY"])

        api_response = api_client.crm.deals.basic_api.get_by_id(
          deal_id: 15770602833, 
          properties: ["hubspot_owner_id, dealname, chain, dealstage, state, tte_servicing_pharmacy, 
                      total_residential_individuals, probability_of_close, go_live_date, incumbent_pharmacy, delivery_type, 
                      comments, pipeline_date, forecasted_individuals, number_of_delivery_locations"], 
          archived: false
        )
      
        prop=api_response.properties 
        puts prop



        # deals = api_response.results[0].properties

        # api_response.results.each do |deal|
        #     on=deal.properties["hubspot_owner_id"]
        #     dealstage=deal.properties["dealstage"]            

        #     a=([
        #         team_id: Team.find_by_hs_deal_owner_number(on).id,
        #         name: deal.properties["dealname"],
        #         chain: deal.properties["chain"],
        #         deal_stage_id: DealStage.find_by_number(dealstage).id,
        #         state: deal.properties["state"],
        #         tte_servicing_pharmacy: deal.properties["tte_servicing_pharmacy"],
        #         total_residential_individuals: deal.properties["total_residential_individuals"],
        #         probability_of_close: deal.properties["probability_of_close"],
        #         go_live_date: deal.properties["go_live_date"],
        #         incumbent_pharmacy: deal.properties["incumbent_pharmacy"],
        #         delivery_type: deal.properties["delivery_type"],
        #         comments: deal.properties["comments"],
        #         pipeline_date: deal.properties["pipeline_date"],
        #         forecasted_individuals: deal.properties["forecasted_individuals"],
        #         objectid: deal.properties["hs_object_id"]
        #     ])
           

        #      b = Deal.create(a)

        #      puts b
           
            

            # team_id=Team.find_by_hs_deal_owner_number(on).id
            # name=deal.properties["dealname"] if deal.properties["dealname"]
            # chain=deal.properties["chain"] #if deal.properties["chain"]
            
            #dealstage = DealStage.find_by_number(dealstage).name         

            # state=deal.properties["state"]
            # tte_servicing_pharmacy = deal.properties["tte_servicing_pharmacy"] 
            # total_residential_individuals = deal.properties["total_residential_individuals"]             
            # probability_of_close = deal.properties["probability_of_close"]  
            # go_live_date=deal.properties["go_live_date"]

            # incumbent_pharmacy = deal.properties["incumbent_pharmacy"]  
            # delivery_type = deal.properties["delivery_type"]  
            # comments = deal.properties["comments"]  

            # deal.properties["total_residential_individuals"]  
            # pipeline_date = deal.properties["pipeline_date"]  
            # forecasted_individuals = deal.properties["forecasted_individuals"]     


        #end
        # Deal.create(deals)   

   
      end
    end
  end