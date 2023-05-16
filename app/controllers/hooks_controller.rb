class HooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:ipn_webhook]       
  skip_before_action :authenticate_user! # if you use Devise    

  def ipn_webhook
    webhooks = JSON.parse(request.raw_post)   
    webhooks.each do |wh| 

      if wh["subscriptionType"] == "deal.deletion"
        puts "Delete Deal"

        deal=Deal.find_by_objectid(wh['objectId'])
        deal.delete = true
        deal.save

        # pp wh["subscriptionType"]         
        # pp wh["objectId"]                 
        # pp wh["sourceId"]
        # pp wh["occurredAt"]
        # pp wh["changeSource"]

      elsif wh["subscriptionType"] == "deal.propertyChange"

        if Deal.where(objectid: wh['objectId']).exists?
          puts "I exist update me"

          deal=Deal.find_by_objectid(wh['objectId'])
          pp deal

          if wh['propertyName'] == "dealname"
            deal.name = wh['propertyValue']
            deal.save
          else
            att=wh['propertyName']
            deal.att = wh['propertyValue']
            deal.save
          end
          event = Event.new(
            event_type: wh['subscriptionType'].split('.').last,
            object_id: wh['objectId'],
            event_id: wh['eventId'],
            occured_at: wh['occurredAt'],
            deal_id: dea.id
          )
          if event.event_type == 'propertyChange'
            event.assign_attributes(
              property_name: wh['propertyName'],
              property_value: wh['propertyValue']
            )
          end
          event.save!
        else
          puts "I Dont exist in the DB"

          # require 'hubspot-api-client'
          # api_client = Hubspot::Client.new(access_token: 'pat-na1-3903dc60-2e81-45e5-b9cd-d8a80007be28')

          # api_response = api_client.crm.deals.basic_api.get_by_id(
          #   deal_id: wh['objectId'], 
          #   properties: ["hubspot_owner_id, dealname, chain, dealstage, state, tte_servicing_pharmacy, 
          #                total_residential_individuals, probability_of_close, go_live_date, incumbent_pharmacy, delivery_type, comments, pipeline_date"], 
          #   archived: false
          # )

          # pp api_response.properties

          #result=api_response.properties
          # puts result[""]
          #deal=Deal.new
          #deal.name=result["dealname"]

        end        
      end     

      if wh["subscriptionType"] == "deal.creation"
        puts "Create Deal"
        puts wh["objectId"]    
      end
      
    end #webhooks.each do |wh| 

  end #def ipn_webhook       
end
