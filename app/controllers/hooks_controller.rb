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
    
    #  a="eyJ0eXAiOiJKV1QiLCJub25jZSI6IktIcmlCcW5ldVBoZVNkV1hyWFJkTE9pajVvRDJSMzRKc0VmR0NSQ1VqVXciLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81YzQ2NDlmOC04MGM2LTRhMTItODEwNy01ZGQ3ZTZlY2QyNzcvIiwiaWF0IjoxNjg0NzcxNjA4LCJuYmYiOjE2ODQ3NzE2MDgsImV4cCI6MTY4NDg1ODMwOCwiYWNjdCI6MCwiYWNyIjoiMSIsImFpbyI6IkFZUUFlLzhUQUFBQTZWcUdjQjZkRFdyWldkZFpDZ0JoeUI1cVNSOWdyWG5iTUVGdmg4UHZzNVFZNXNBSWdnSGlrZFpvRlpySU1HeWxoSjNYa2RPSm1jZnVYRHk2dmdOYmFocmF6N3hHeEdpL25GOTU0eUdUaDNqQ1MvRWdRWWZJSnB5TmlmVWlGR2wreU9NUExIK0RBNks5NnRnRi9LcXRPeXg3aUdRbUhZaTRabEtKTlFlZy8xMD0iLCJhbXIiOlsicnNhIiwibWZhIl0sImFwcF9kaXNwbGF5bmFtZSI6IkdyYXBoIEV4cGxvcmVyIiwiYXBwaWQiOiJkZThiYzhiNS1kOWY5LTQ4YjEtYThhZC1iNzQ4ZGE3MjUwNjQiLCJhcHBpZGFjciI6IjAiLCJjYXBvbGlkc19sYXRlYmluZCI6WyJhNTZkN2JjMC01ODQwLTQ0N2EtODJhNS1jM2VhYjA2YjdkMjgiXSwiZGV2aWNlaWQiOiJjMTk3ZDcxMS03OTkxLTQwMjMtYmVhZC1iMjhjMmE1YTBjMzIiLCJmYW1pbHlfbmFtZSI6IlBvbGFuY28iLCJnaXZlbl9uYW1lIjoiSm9zZSIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjY5LjExNy4yMDguMTkzIiwibmFtZSI6Ikpvc2UgUG9sYW5jbyIsIm9pZCI6IjllNWIzMzlmLWI0ZmMtNDIzMi1hZDM3LWI0M2FhNGE4YWE2ZiIsIm9ucHJlbV9zaWQiOiJTLTEtNS0yMS02NTAwODIxNDEtMTkyMTQwMDk3NS0zMzAwODc5MjA5LTM3MTEiLCJwbGF0ZiI6IjMiLCJwdWlkIjoiMTAwMzIwMDFBNDNEN0ZCMyIsInJoIjoiMC5BVkVBLUVsR1hNYUFFa3FCQjEzWDV1elNkd01BQUFBQUFBQUF3QUFBQUFBQUFBQlJBTVkuIiwic2NwIjoiQXVkaXRMb2cuUmVhZC5BbGwgRGV2aWNlTWFuYWdlbWVudE1hbmFnZWREZXZpY2VzLlJlYWQuQWxsIERldmljZU1hbmFnZW1lbnRNYW5hZ2VkRGV2aWNlcy5SZWFkV3JpdGUuQWxsIERpcmVjdG9yeS5SZWFkLkFsbCBGaWxlcy5SZWFkIEZpbGVzLlJlYWQuQWxsIEZpbGVzLlJlYWRXcml0ZSBGaWxlcy5SZWFkV3JpdGUuQWxsIG9wZW5pZCBwcm9maWxlIFNpdGVzLk1hbmFnZS5BbGwgU2l0ZXMuUmVhZC5BbGwgU2l0ZXMuUmVhZFdyaXRlLkFsbCBVc2VyLlJlYWQgZW1haWwiLCJzaWduaW5fc3RhdGUiOlsiZHZjX21uZ2QiLCJkdmNfY21wIiwia21zaSJdLCJzdWIiOiJkY0M1aklqOEY1QV9rREltUVRGSldZdWZFVXpaY1J6bGVnOUJfMU1ENkhjIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6Ik5BIiwidGlkIjoiNWM0NjQ5ZjgtODBjNi00YTEyLTgxMDctNWRkN2U2ZWNkMjc3IiwidW5pcXVlX25hbWUiOiJqb3NlLnBvbGFuY29AdGFycnl0b3duZXhwb2NhcmUuY29tIiwidXBuIjoiam9zZS5wb2xhbmNvQHRhcnJ5dG93bmV4cG9jYXJlLmNvbSIsInV0aSI6ImNnZDY0d0ZMYUVTaFJCTExHSmtoQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbImI3OWZiZjRkLTNlZjktNDY4OS04MTQzLTc2YjE5NGU4NTUwOSJdLCJ4bXNfY2MiOlsiQ1AxIl0sInhtc19zc20iOiIxIiwieG1zX3N0Ijp7InN1YiI6Ijd2TDRWTVpHNGhmLUdUQURXMUgxdDR3TzVudXk4VkwxWXJhakJNcEZJSkUifSwieG1zX3RjZHQiOjE1ODM5MzM1MDV9.O1q_4Et_7hWs7uG33henKoYUDxvx8UGXEfOsnGNnVsze6Lhxz5chJyJjXqiZPYOzp4T8Gqjh5H-UdyBYJOIwRmfOhiQH43pxloNoshVQM4CrRrRBVtifpPBBw1OrWwyFcRkS2DjNAmSiq9gzHL_J_j2zcD6yrl8cNVHaaDcrh-KOvj4iI0QOxG6Stxq5qHCif9NOJAeXecrp8spIwwwDtKtr01IWzNDQ2qPgZKBKVcQ9mJEuFVO4YoxpCwZSGTUfh3X2Kx0accSnHTnFBU5RghJn1LKybSoUyne4L17CA77IhNpkkr2aCLXb1TC-M_HGNHuheVjpIGTcEfG_NcWJtg"

    webhooks = JSON.parse(request.raw_post)   
    webhooks.each do |wh| 

      if wh["subscriptionType"] == "deal.propertyChange"

        if Deal.where(objectid: wh['objectId']).exists?
          puts "I exist update me"

          deal=Deal.find_by_objectid(wh['objectId'])
          # pp deal

          puts wh['propertyName']
          puts wh['propertyValue']

          # if wh['propertyName'] == "dealstage"
          #  deal_stage_id=DealStage.find_by_number(wh['propertyValue']).id
          #  deal=Deal.update(deal.id, {"deal_stage_id" => deal_stage_id} )  
          # else
          #   deal=Deal.update(deal.id, {wh['propertyName'] => wh['propertyValue']} )
          # end 
          
          if wh['propertyName'] == "dealstage"
            deal_stage_id=DealStage.find_by_number(wh['propertyValue']).id
            Deal.update(deal.id, {"deal_stage_id" => deal_stage_id} )
          elsif  wh['propertyName'] == "hubspot_owner_id"
            team=Team.find_by_hs_deal_owner_number(wh['propertyValue'])
            Deal.find_by_objectid(wh['objectId']).update(team_id: team.id)
          else
            Deal.update(deal.id, {wh['propertyName'] => wh['propertyValue']} )
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

          # lead_name = deal.dealname         
         
          # get_str = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/tables/table1/rows" #add
          # encoded = URI::DEFAULT_PARSER.escape(get_str)

          # response = HTTParty.get("#{encoded}",
          #   :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )          
                      
          # response["value"].each do |r|       

          #   r["values"].each do |v|
            
          #     if v[1] == lead_name
          #       pp v[1]
          #       puts index=r["index"]
          #       total=index + 2 

          #       str = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/range(address='A#{total}:T#{total}')" #patch
          #       encoded = URI::DEFAULT_PARSER.escape(str)

          #       os = '"Onboarding - Sales"'
          #       op = '"Onboarding - In Progress"'
          #       oc = '"Onboarding - Complete"'
          #       y = '"Y"'
          #       n = '"N"'

          #       response2 = HTTParty.patch("#{encoded}",
          #       :body => {  
          #         "values"=>[
          #           [deal.team.name, lead_name, deal.chain, 
          #           deal.deal_stage.name, deal.state, deal.tte_servicing_pharmacy, deal.total_residential_individuals, 
          #           deal.probability_of_close, deal.go_live_date,
          #           deal.incumbent_pharmacy, deal.delivery_type, deal.comments, deal.pipeline_date, deal.forecasted_individuals,
          #           "=IFERROR(EDATE(I#{total},-1),"")", 
          #           "=EDATE(I#{total},1)",
          #           "=VLOOKUP(I#{total},Date_Lookups[#All],14,FALSE)",
          #           "=VLOOKUP(I#{total},Date_Lookups[#All],6,FALSE)", 
          #           "=IF(D#{total}=#{os},#{y},IF(D#{total}=#{op},#{y},IF(D#{total}=#{oc},#{y},#{n})))" , 
          #           "=YEAR([@[Go Live'' Date]])"
          #           ]
          #         ]                     
                            
          #       }.to_json,
          #       :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )       

          #       pp response2

          #     end # if v[1] == lead          

          #   end # r["values"].each do |v|      

          # end # response["value"].each do |r|  


        else
          puts "I Dont exist in the DB, create deal in the DB"

          require 'hubspot-api-client' 
          api_client = Hubspot::Client.new(access_token: 'pat-na1-54430935-b008-4993-8a0f-c0af27fe08f0')

          api_response = api_client.crm.deals.basic_api.get_by_id(
            deal_id: wh['objectId'], 
            properties: ["hubspot_owner_id, dealname, chain, dealstage, state, tte_servicing_pharmacy, 
                        total_residential_individuals, probability_of_close, go_live_date, incumbent_pharmacy, delivery_type, 
                        comments, pipeline_date, forecasted_individuals"], 
            archived: false
          )
          
          prop=api_response.properties 

          #  puts prop["hubspot_owner_id"]
          team_id=Team.find_by_hs_deal_owner_number(prop["hubspot_owner_id"]).id
          #  puts team_id
    
          deal_stage_id=DealStage.find_by_number(prop["dealstage"]).id
          #  puts deal_stage_id
          
         deal = Deal.create(
          team_id: team_id,
          dealname: prop["dealname"],
          chain: prop["chain"],
          deal_stage_id: deal_stage_id,
          state: prop["state"],
          tte_servicing_pharmacy: prop["tte_servicing_pharmacy"],
          total_residential_individuals: prop["total_residential_individuals"],
          probability_of_close: prop["probability_of_close"],
          go_live_date: prop["go_live_date"],
          incumbent_pharmacy: prop["incumbent_pharmacy"],
          delivery_type: prop["delivery_type"],
          comments: prop["comments"],
          pipeline_date: prop["pipeline_date"],
          forecasted_individuals: prop["forecasted_individuals"],
          objectid: prop["hs_object_id"]
          ) 

          pp deal.name
          pp deal.created_at

          #add to the Pipeline in excel 

          # get_str = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/tables/table1/rows" #add
          # encoded = URI::DEFAULT_PARSER.escape(get_str)

          # response = HTTParty.get("#{encoded}",
          #   :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } ) 
            
          # # pp response   

          # total = response["value"].size + 2
          # puts total

          # os = '"Onboarding - Sales"'
          # op = '"Onboarding - In Progress"'
          # oc = '"Onboarding - Complete"'
          # y = '"Y"'
          # n = '"N"'

          # response2 = HTTParty.post("#{encoded}",
          # :body => {  
          #   "values"=>[
          #     [deal.team.name, deal.name, deal.chain, 
          #     deal.deal_stage.name, deal.state, deal.tte_servicing_pharmacy, deal.total_residential_individuals, 
          #     deal.probability_of_close, deal.go_live_date,
          #     deal.incumbent_pharmacy, deal.delivery_type, deal.comments, deal.pipeline_date, deal.forecasted_individuals,
          #     "=IFERROR(EDATE(I#{total},-1),"")", 
          #     "=EDATE(I#{total},1)",
          #     "=VLOOKUP(I#{total},Date_Lookups[#All],14,FALSE)",
          #     "=VLOOKUP(I#{total},Date_Lookups[#All],6,FALSE)", 
          #     "=IF(D#{total}=#{os},#{y},IF(D#{total}=#{op},#{y},IF(D#{total}=#{oc},#{y},#{n})))" , 
          #     "=YEAR([@[Go Live'' Date]])"
          #     ]
          #   ]                     
                      
          # }.to_json,
          # :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } ) 
          
          # pp response2

          # #add Event to DB
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

        end

      elsif wh["subscriptionType"] == "deal.deletion"
        puts "Delete Deal"

        deal=Deal.find_by_objectid(wh['objectId'])
        deal.remove = true
        deal.save

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
        
      elsif wh["subscriptionType"] == "deal.creation"
        puts "Create Deal"
        puts wh["objectId"]

        require 'hubspot-api-client' 
          api_client = Hubspot::Client.new(access_token: 'pat-na1-54430935-b008-4993-8a0f-c0af27fe08f0')

          api_response = api_client.crm.deals.basic_api.get_by_id(
            deal_id: wh['objectId'], 
            properties: ["hubspot_owner_id, dealname, chain, dealstage, state, tte_servicing_pharmacy, 
                        total_residential_individuals, probability_of_close, go_live_date, incumbent_pharmacy, delivery_type, 
                        comments, pipeline_date, forecasted_individuals"], 
            archived: false
          )
          
          prop=api_response.properties 

          #  puts prop["hubspot_owner_id"]
          team_id=Team.find_by_hs_deal_owner_number(prop["hubspot_owner_id"]).id
          #  puts team_id
    
          deal_stage_id=DealStage.find_by_number(prop["dealstage"]).id
          #  puts deal_stage_id
          
          deal = Deal.create(
            team_id: team_id,
            dealname: prop["dealname"],
            chain: prop["chain"],
            deal_stage_id: deal_stage_id,
            state: prop["state"],
            tte_servicing_pharmacy: prop["tte_servicing_pharmacy"],
            total_residential_individuals: prop["total_residential_individuals"],
            probability_of_close: prop["probability_of_close"],
            go_live_date: prop["go_live_date"],
            incumbent_pharmacy: prop["incumbent_pharmacy"],
            delivery_type: prop["delivery_type"],
            comments: prop["comments"],
            pipeline_date: prop["pipeline_date"],
            forecasted_individuals: prop["forecasted_individuals"],
            objectid: prop["hs_object_id"]
          ) 

          pp deal.name

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

      end #if wh["subscriptionType"] == "deal.propertyChange"               
    end #webhooks.each do |wh| 

  end #def ipn_webhook       
end
