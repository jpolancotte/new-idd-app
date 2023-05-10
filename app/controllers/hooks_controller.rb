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
          
         e = Event.new
             e.event_type=wh["subscriptionType"]
             e.object_id=wh["objectId"]   
             e.occured_at=whwh["occurredAt"]
          e.save

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
