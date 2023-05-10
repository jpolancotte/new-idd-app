namespace :db do
    namespace :seed do
      desc "convert string to lower cas underscore"
      task api_add1: :environment do
        
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

       

       #approve app in HubSpot account

        # require 'uri'
        # require 'net/http'
        # require 'openssl'          

        # url = URI("https://{yourDomain}/oauth/token")

        # http = Net::HTTP.new(url.host, url.port)
        # http.use_ssl = true
        # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        # request = Net::HTTP::Post.new(url)
        # request["content-type"] = 'application/x-www-form-urlencoded'
        # request.body = "grant_type=authorization_code&client_id={yourClientId}&client_secret=%7ByourClientSecret%7D&code=%7ByourAuthorizationCode%7D&redirect_uri={https://yourApp/callback}"

          

        # curl --request POST \
        # --url 'https://api.hubapi.com/oauth/v1/token' \
        # --header 'content-type: application/x-www-form-urlencoded' \
        # --data grant_type=authorization_code \
        # --data 'client_id=89805094-efbf-4679-835a-44fd7350b0bd' \
        # --data 'client_secret=07371b87-b927-4022-88fd-0f10f53a739c' \
        # --data 'code=3639c5a7-815c-4f2c-96a0-a28ad7afd6e0' \
        # --data 'redirect_uri=http://localhost:3000/'

        # {"token_type":"bearer","refresh_token":"e3e9ba5f-4a85-4614-954d-12a5de64fe42","access_token":"CIqiv7b_MBIMAAEAQAAAAAAAAAAYGOST8AkgiJmTDSiSpmYyFHeipHoXbl16ImFTZ5oNcOh6X0noOjAAAABBAAAAAAAAAAAAAAAAAIAAAAAAAAAAAAAAAAAAAABgAAAAAAAAAPwAAAAAIANCFHIHB9fx45vdY4zcbd1CrhrSiVp5SgNuYTFSAFoA","expires_in":1800}


#         body = {
#         'grant_type': 'authorization_code',
#         'client_id': '309d03b1-21f5-465c-a05b-fb901bda1aa3',
#         'client_secret': 'cac35b11-6b01-4c15-a189-c88014035c6f',
#         'redirect_uri': 'https://new-idd-app.herokuapp.com',
#         'code': 'c25bfcbf-2870-41cb-9c63-0b5e37efeec5'
# }

              


#         response = HTTParty.post("https://api.hubapi.com/oauth/v1/token", parmas: body,
#         Headers: "Content-Type: application/x-www-form-urlencoded;charset=utf-8" )

#         pp response


        
        str = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/tables/table1/rows" #add
        
        encoded = URI::DEFAULT_PARSER.escape(str)

        puts encoded  

        a="eyJ0eXAiOiJKV1QiLCJub25jZSI6Ik9PUGNrTmE3akprVWhPUklFcGVUMG12cXpWczdVRVcxbnNpdUJpTTVGazgiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81YzQ2NDlmOC04MGM2LTRhMTItODEwNy01ZGQ3ZTZlY2QyNzcvIiwiaWF0IjoxNjgzNjQ4NDk0LCJuYmYiOjE2ODM2NDg0OTQsImV4cCI6MTY4MzczNTE5NCwiYWNjdCI6MCwiYWNyIjoiMSIsImFpbyI6IkFZUUFlLzhUQUFBQTA2UlZ0cnN4YzEzTmgrYXhWemZ3OGRPMGhURlhUbCtwVjhrTmk0dDgzdGY1cG9nNEJXMk90UzV3aHRRK2xtSVhvVkN3aVFzZENDemhOVmhXVkNHeXdZdUJWVlI5NEZHRWd4ekR3bnNtSmZKV0xnNE82MHF6YmltbEtidHZvbHBtNVN2MGpZUDlSQXlvWXBXUmpKditXNmZRS2tuZHM2aFZXejZZMlh5c2daTT0iLCJhbXIiOlsicnNhIiwibWZhIl0sImFwcF9kaXNwbGF5bmFtZSI6IkdyYXBoIEV4cGxvcmVyIiwiYXBwaWQiOiJkZThiYzhiNS1kOWY5LTQ4YjEtYThhZC1iNzQ4ZGE3MjUwNjQiLCJhcHBpZGFjciI6IjAiLCJjYXBvbGlkc19sYXRlYmluZCI6WyJhNTZkN2JjMC01ODQwLTQ0N2EtODJhNS1jM2VhYjA2YjdkMjgiXSwiZGV2aWNlaWQiOiJjMTk3ZDcxMS03OTkxLTQwMjMtYmVhZC1iMjhjMmE1YTBjMzIiLCJmYW1pbHlfbmFtZSI6IlBvbGFuY28iLCJnaXZlbl9uYW1lIjoiSm9zZSIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjY5LjExNy4yMDguMTkzIiwibmFtZSI6Ikpvc2UgUG9sYW5jbyIsIm9pZCI6IjllNWIzMzlmLWI0ZmMtNDIzMi1hZDM3LWI0M2FhNGE4YWE2ZiIsIm9ucHJlbV9zaWQiOiJTLTEtNS0yMS02NTAwODIxNDEtMTkyMTQwMDk3NS0zMzAwODc5MjA5LTM3MTEiLCJwbGF0ZiI6IjMiLCJwdWlkIjoiMTAwMzIwMDFBNDNEN0ZCMyIsInJoIjoiMC5BVkVBLUVsR1hNYUFFa3FCQjEzWDV1elNkd01BQUFBQUFBQUF3QUFBQUFBQUFBQlJBTVkuIiwic2NwIjoiQXVkaXRMb2cuUmVhZC5BbGwgRGV2aWNlTWFuYWdlbWVudE1hbmFnZWREZXZpY2VzLlJlYWQuQWxsIERldmljZU1hbmFnZW1lbnRNYW5hZ2VkRGV2aWNlcy5SZWFkV3JpdGUuQWxsIERpcmVjdG9yeS5SZWFkLkFsbCBGaWxlcy5SZWFkIEZpbGVzLlJlYWQuQWxsIEZpbGVzLlJlYWRXcml0ZSBGaWxlcy5SZWFkV3JpdGUuQWxsIG9wZW5pZCBwcm9maWxlIFNpdGVzLk1hbmFnZS5BbGwgU2l0ZXMuUmVhZC5BbGwgU2l0ZXMuUmVhZFdyaXRlLkFsbCBVc2VyLlJlYWQgZW1haWwiLCJzaWduaW5fc3RhdGUiOlsiZHZjX21uZ2QiLCJkdmNfY21wIiwia21zaSJdLCJzdWIiOiJkY0M1aklqOEY1QV9rREltUVRGSldZdWZFVXpaY1J6bGVnOUJfMU1ENkhjIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6Ik5BIiwidGlkIjoiNWM0NjQ5ZjgtODBjNi00YTEyLTgxMDctNWRkN2U2ZWNkMjc3IiwidW5pcXVlX25hbWUiOiJqb3NlLnBvbGFuY29AdGFycnl0b3duZXhwb2NhcmUuY29tIiwidXBuIjoiam9zZS5wb2xhbmNvQHRhcnJ5dG93bmV4cG9jYXJlLmNvbSIsInV0aSI6Ilo3QnNPT1JyVkVlLW5NcVRTUHh4QUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbImI3OWZiZjRkLTNlZjktNDY4OS04MTQzLTc2YjE5NGU4NTUwOSJdLCJ4bXNfY2MiOlsiQ1AxIl0sInhtc19zc20iOiIxIiwieG1zX3N0Ijp7InN1YiI6Ijd2TDRWTVpHNGhmLUdUQURXMUgxdDR3TzVudXk4VkwxWXJhakJNcEZJSkUifSwieG1zX3RjZHQiOjE1ODM5MzM1MDV9.QqMrpWHke84m0p_njGgWu-kIcMLu0NQAXXOuTlqFfI1PPuwFI563DBcnJjaOn044PuowWUS8l8J4DIYJMmHoz2oEGdCl8YSrrpQ_mjnXWUqK61W7ZI6-CA1r3NSsRPhejPmEsOWBv0zQdZZKgYMMEjqa51KNSFf7JxKkaOmT9G8RT2jQ6eUmIFhpup954wYs6pVXHhaiGwwfo-y2g0BLWg2PHD68sIiss4W2KLLzizL_iBtZRG1YC7Y8O_-JhQSOoSTPDj9ziiSg6ZJTV56QiNedEMf3MBq0zigrMLAGmVNwOxzaRR6daMc5t5M98NcdDYy4Ov45yk_kRAQ4GbgRpA"
       
               
        response = HTTParty.get("#{encoded}",
          :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )   
         
          pp response             
        
          total = response["value"].size + 2

          puts total

          # pp response          

          os='"Onboarding - Sales"'
          op='"Onboarding - In Progress"'
          oc = '"Onboarding - Complete"'
          y='"Y"'
          n='"N"'
                   
       response2 = HTTParty.post("#{encoded}",
        :body => 
          {  "values"=>[
            ["Kathy Brown / Nanette Wrobel", "10A123 Apostolico Now EIHA", "", 
            "Sales - Initial Communication", "NJ", "NJ", 100, 0.75, 44166,
            "PAL", "", "", "", "",
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


      # # str1 = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Sales Pipeline/pivotTables/refreshAll"
      # # encoded = URI::DEFAULT_PARSER.escape(str1)
               
      # # response3 = HTTParty.post("#{encoded}",      
      # # :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )
            
      # # pp response3    

        
        
      end
    end
  end

