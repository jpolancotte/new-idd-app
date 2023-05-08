class HooksController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:ipn_webhook]    

    require 'json'

    # before_action :verify_webhook


    def ipn_webhook

    #  puts params["_json"][0]["eventId"]

    #  puts params["_json"][0][:eventId]

    #   puts "Hello JP Now"
     
      # webhook_params=params.require("_json")

      # puts webhook_params

      puts payload = request.body.read

    
      # if params[:eventId].present?

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
