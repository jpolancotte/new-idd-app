class HooksController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:ipn_webhook]


    def ipn_webhook           
    


     # If the body contains the survey_name parameter...
    #  if params[:survery_name].present?
        # Create a new Survey object based on the received parameters...
        # survey = Survey.new(:name => params[:survey_name]
        # survey.url = params[:survey_url]
        # survey.creator_email = params[:survey_creator_email]
        # survey.save!
    #   endherok
  
      # The webhook doesn't require a response but let's make sure
      # we don't send anything
      render :nothing => true
    end

    def call(event)
        case event["subscriptionType"]
        when "deal.propertyChange"
            property_change(event)
        end
    end
    
    def property_change(event)
    # Handle property change event
    end

end
