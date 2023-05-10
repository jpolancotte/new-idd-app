class HooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:ipn_webhook]       
  skip_before_action :authenticate_user! # if you use Devise
    

  def ipn_webhook
    webhooks = JSON.parse(request.raw_post)        
    webhooks.each do |wh|

      if wh["subscriptionType"] == "deal.creation"
        pp "Create Deal"
        pp wh["subscriptionType"]
        pp wh["objectId"]
        pp wh["changeFlag"]
        pp wh["userId"]
        pp wh["occurredAt"]

      elsif  wh["subscriptionType"] == "deal.deletion"
        pp "Delete Deal"
        pp wh["subscriptionType"]
        pp wh["objectId"]
        pp wh["changeFlag"]
        pp wh["userId"]
        pp wh["occurredAt"]

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

 


      
      


    
end
