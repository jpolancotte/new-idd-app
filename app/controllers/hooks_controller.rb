class HooksController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:ipn_webhook]


    def ipn_webhook

      if params[:event_id].present?

        event = Event.new(
            event_type: params['subscriptionType'].split('.').last,
            object_id: params['objectId'],
            event_id: params['eventId'],
            occured_at: params['occurredAt']
          )

          if event.event_type == 'propertyChange'
            event.assign_attributes(
              property_name: params['propertyName'],
              property_value: params['propertyValue']
            )
          end
          event.save!

      end
      


   
    
      
     # If the body contains the survey_name parameter...
    #  if params[:survery_name].present?
        # Create a new Survey object based on the received parameters...
        # survey = Survey.new(:name => params[:survey_name]
        # survey.url = params[:survey_url]
        # survey.creator_email = params[:survey_creator_email]
        # survey.save!
    #   end
  
      # The webhook doesn't require a response but let's make sure
      # we don't send anything
      # render :nothing => true
    end

    
end
