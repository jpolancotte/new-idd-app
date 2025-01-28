namespace :db do
    namespace :seed do
      desc "convert string to lower cas underscore"
      task note_deals: :environment do
        
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

        api_client = Hubspot::Client.new(access_token: ENV["HUBSPOT_API_KEY"])

        body = { inputs: 
          [
            {"associations":
              [
                {"types":[{"associationCategory":"HUBSPOT_DEFINED","associationTypeId":214}],
              "to":{"id":32678775370}}
              ],
              
              "properties":{
                "hs_timestamp": "2022-11-12T15:48:22Z",
                "hs_note_body": "Hello Part 2 with decision maker Carla. Attached the proposal and draft of contract.",
                "hubspot_owner_id": "126872114"
              }
            }
          ] 
        }

        api_response = api_client.crm.objects.notes.batch_api.create(body: body)
        puts api_response

        
      
   
      end
    end
  end