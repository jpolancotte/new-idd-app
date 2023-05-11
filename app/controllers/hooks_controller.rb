class HooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:ipn_webhook]       
  skip_before_action :authenticate_user! # if you use Devise
    

  def ipn_webhook
    webhooks = JSON.parse(request.raw_post)     
   
      webhooks.each do |wh| 

        if wh["subscriptionType"] == "deal.deletion"

          puts "Delete Deal"
          pp wh["subscriptionType"]         
          pp wh["objectId"]                 
          pp wh["sourceId"]
          pp wh["occurredAt"]
          pp wh["changeSource"]
        end

        if wh["subscriptionType"] == "deal.propertyChange"
          
          # find deal first before creating event if not request hubspot api

          require 'hubspot-api-client'

          api_client = Hubspot::Client.new(access_token: 'pat-na1-3903dc60-2e81-45e5-b9cd-d8a80007be28')

          api_response = api_client.crm.deals.basic_api.get_by_id(
            deal_id: wh['objectId'], 
            properties: ["hubspot_owner_id, dealname, chain, dealstage, state, tte_servicing_pharmacy, 
                         total_residential_individuals, probability_of_close, go_live_date, incumbent_pharmacy, delivery_type, comments, pipeline_date"], 
            archived: false
          )

          puts api_response

          puts properties=api_response[:properties]

          

         

          # puts api_response[:id]
          # puts api_response[:id]
          
          event = Event.new(
            event_type: wh['subscriptionType'].split('.').last,
            object_id: wh['objectId'],
            event_id: wh['eventId'],
            occured_at: wh['occurredAt']
          )
          if event.event_type == 'propertyChange'
            event.assign_attributes(
              property_name: wh['propertyName'],
              property_value: wh['propertyValue']
            )
          end
          event.save!


          # send data to excel pipeline

          puts "Update Deal"
          pp wh["subscriptionType"]
          pp wh["propertyName"] 
          pp wh["propertyValue"] 
          pp wh["objectId"]                 
          pp wh["sourceId"]
          pp wh["occurredAt"]
          pp wh["changeSource"]
        end

        if wh["subscriptionType"] == "deal.creation"

          puts "Create Deal"
          puts wh["objectId"]     

        end
       
      end 

  end

  # webhooks.ech do |hook|

  #   puts 

  # end

  

  # puts params[:hook][:_json][:eventId]
  

    
        
  # webhook_params=params.require("_json")

  # puts webhook_params

      
  # if params[:user_id].present?

  #   event = Event.new(
  #       event_type: params['subscriptionType'].split('.').last,
  #       object_id: params['objectId'],
  #       event_id: params['eventId'],
  #       occured_at: params['occurredAt']
  #     )

  #     if event.event_type == 'propertyChange'
  #       event.assign_attributes(
  #         property_name: params['propertyName'],
  #         property_value: params['propertyValue']
  #       )
  #     end
  #     event.save!

  # end     
      
end
