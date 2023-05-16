class HooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:ipn_webhook]       
  skip_before_action :authenticate_user! # if you use Devise  
  
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
          # pp deal

          puts wh['propertyName']
          puts wh['propertyValue']

          if wh['propertyName'] == "dealstage"
           deal=DealStage.find_by_number(wh['propertyValue'])
           deal=Deal.update(deal.id, {name => wh['propertyValue']} )  
          else
            deal=Deal.update(deal.id, {wh['propertyName'] => wh['propertyValue']} )
          end         
         
          event = Event.new(
            event_type: wh['subscriptionType'].split('.').last,
            object_id: wh['objectId'],
            event_id: wh['eventId'],
            occured_at: wh['occurredAt'],
            deal_id: deal.id
          )
          if event.event_type == 'propertyChange'
            event.assign_attributes(
              property_name: wh['propertyName'],
              property_value: wh['propertyValue']
            )
          end
          event.save!

          lead_name = deal.dealname

          

          a="eyJ0eXAiOiJKV1QiLCJub25jZSI6IkRWcVdKYXlwRVd6V3BfNmItVmhqZ1NGRWhKZnAwdEx5ZHNBdGw1akFQYnciLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81YzQ2NDlmOC04MGM2LTRhMTItODEwNy01ZGQ3ZTZlY2QyNzcvIiwiaWF0IjoxNjg0Mjc0MTQ2LCJuYmYiOjE2ODQyNzQxNDYsImV4cCI6MTY4NDM2MDg0NiwiYWNjdCI6MCwiYWNyIjoiMSIsImFpbyI6IkFZUUFlLzhUQUFBQTF1dnlEN1VOWWtjMktLSkFSVGtuTGw5RVFlZHMvcWtrcXl2eTBjWVF4akNScHplc0ViOHRpb21LZkRuN3BqK1FHRVVTVVl4QWlWMXRsUFp2c05ZR2pINzdlQnVSVEVlZGhIY09pT3NOdmJvQjlwNjhQN0JqazlJTHFQVS9xM1BxTDFZb1VHWWQ2eWc1aHdiMEdnVFpVMWlRK0MzRTdBL0NkNE1XUVNKRlE0MD0iLCJhbXIiOlsicnNhIiwibWZhIl0sImFwcF9kaXNwbGF5bmFtZSI6IkdyYXBoIEV4cGxvcmVyIiwiYXBwaWQiOiJkZThiYzhiNS1kOWY5LTQ4YjEtYThhZC1iNzQ4ZGE3MjUwNjQiLCJhcHBpZGFjciI6IjAiLCJjYXBvbGlkc19sYXRlYmluZCI6WyJhNTZkN2JjMC01ODQwLTQ0N2EtODJhNS1jM2VhYjA2YjdkMjgiXSwiZGV2aWNlaWQiOiJjMTk3ZDcxMS03OTkxLTQwMjMtYmVhZC1iMjhjMmE1YTBjMzIiLCJmYW1pbHlfbmFtZSI6IlBvbGFuY28iLCJnaXZlbl9uYW1lIjoiSm9zZSIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjY5LjExNy4yMDguMTkzIiwibmFtZSI6Ikpvc2UgUG9sYW5jbyIsIm9pZCI6IjllNWIzMzlmLWI0ZmMtNDIzMi1hZDM3LWI0M2FhNGE4YWE2ZiIsIm9ucHJlbV9zaWQiOiJTLTEtNS0yMS02NTAwODIxNDEtMTkyMTQwMDk3NS0zMzAwODc5MjA5LTM3MTEiLCJwbGF0ZiI6IjMiLCJwdWlkIjoiMTAwMzIwMDFBNDNEN0ZCMyIsInJoIjoiMC5BVkVBLUVsR1hNYUFFa3FCQjEzWDV1elNkd01BQUFBQUFBQUF3QUFBQUFBQUFBQlJBTVkuIiwic2NwIjoiQXVkaXRMb2cuUmVhZC5BbGwgRGV2aWNlTWFuYWdlbWVudE1hbmFnZWREZXZpY2VzLlJlYWQuQWxsIERldmljZU1hbmFnZW1lbnRNYW5hZ2VkRGV2aWNlcy5SZWFkV3JpdGUuQWxsIERpcmVjdG9yeS5SZWFkLkFsbCBGaWxlcy5SZWFkIEZpbGVzLlJlYWQuQWxsIEZpbGVzLlJlYWRXcml0ZSBGaWxlcy5SZWFkV3JpdGUuQWxsIG9wZW5pZCBwcm9maWxlIFNpdGVzLk1hbmFnZS5BbGwgU2l0ZXMuUmVhZC5BbGwgU2l0ZXMuUmVhZFdyaXRlLkFsbCBVc2VyLlJlYWQgZW1haWwiLCJzaWduaW5fc3RhdGUiOlsiZHZjX21uZ2QiLCJkdmNfY21wIiwia21zaSJdLCJzdWIiOiJkY0M1aklqOEY1QV9rREltUVRGSldZdWZFVXpaY1J6bGVnOUJfMU1ENkhjIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6Ik5BIiwidGlkIjoiNWM0NjQ5ZjgtODBjNi00YTEyLTgxMDctNWRkN2U2ZWNkMjc3IiwidW5pcXVlX25hbWUiOiJqb3NlLnBvbGFuY29AdGFycnl0b3duZXhwb2NhcmUuY29tIiwidXBuIjoiam9zZS5wb2xhbmNvQHRhcnJ5dG93bmV4cG9jYXJlLmNvbSIsInV0aSI6IkR6a0xFQXFlcWtpdnpsZXg5VE1QQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbImI3OWZiZjRkLTNlZjktNDY4OS04MTQzLTc2YjE5NGU4NTUwOSJdLCJ4bXNfY2MiOlsiQ1AxIl0sInhtc19zc20iOiIxIiwieG1zX3N0Ijp7InN1YiI6Ijd2TDRWTVpHNGhmLUdUQURXMUgxdDR3TzVudXk4VkwxWXJhakJNcEZJSkUifSwieG1zX3RjZHQiOjE1ODM5MzM1MDV9.IX4ZaWLoBU6nXRmowG57o5pG8w1bQVkUE-hLJIGLaFMRyaMjcjoEv-snqOuefuzDXNE14uIiNo5tV6ah7ZoGhTm_W9uwGvoFGIT6d-PltLO7wmnRov4pfSwmytA2nnrLKFQOXDTKcJnP_kJJqE6QTWyQngHlh_aU94z9p1AzxjLMzqU3V7sAuIWZjI_HwYuBiWJCGHqCN7FXRk8yXbVE7w4_laRFrY5UIyfuErJJ5eLFARPZAXz76qosbx1lZscANvhX6_50ni00DW3cIJWBpXnyI3MXTZXlrCgmZxt7HIOG3J0A5dXuFAtoKbbl4VzIeYBBNy01gPnQ3rOca7zg2Q"

          get_str = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/tables/table1/rows" #add
          encoded = URI::DEFAULT_PARSER.escape(get_str)

          response = HTTParty.get("#{encoded}",
            :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )          
                      
          response["value"].each do |r|       

            r["values"].each do |v|
            
              if v[1] == lead_name
                pp v[1]
                puts index=r["index"]
                total=index + 2 

                str = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/range(address='A#{total}:T#{total}')" # patch
                encoded = URI::DEFAULT_PARSER.escape(str)

                os = '"Onboarding - Sales"'
                op = '"Onboarding - In Progress"'
                oc = '"Onboarding - Complete"'
                y = '"Y"'
                n = '"N"'

                response2 = HTTParty.patch("#{encoded}",
                :body => {  
                  "values"=>[
                    [deal.team.name, lead_name, deal.chain, 
                    deal.deal_stage.name, deal.state, deal.tte_servicing_pharmacy, deal.total_residential_individuals, 
                    deal.probability_of_close, deal.go_live_date,
                    deal.incumbent_pharmacy, deal.delivery_type, deal.comments, deal.pipeline_date, deal.forecasted_individuals,
                    "=IFERROR(EDATE(I#{total},-1),"")", 
                    "=EDATE(I#{total},1)",
                    "=VLOOKUP(I#{total},Date_Lookups[#All],14,FALSE)",
                    "=VLOOKUP(I#{total},Date_Lookups[#All],6,FALSE)", 
                    "=IF(D#{total}=#{os},#{y},IF(D#{total}=#{op},#{y},IF(D#{total}=#{oc},#{y},#{n})))" , 
                    "=YEAR([@[Go Live'' Date]])"
                    ]
                  ]                     
                            
                }.to_json,
                :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )       

                pp response2

              end # if v[1] == lead          

            end # r["values"].each do |v|      

          end # response["value"].each do |r|  


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

      # if wh["subscriptionType"] == "deal.creation"
      #   puts "Create Deal"
      #   puts wh["objectId"]    
      # end
      
    end #webhooks.each do |wh| 

  end #def ipn_webhook       
end
