namespace :db do
    namespace :seed do
      desc "convert string to lower cas underscore"
      task api_delete: :environment do
        
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


        lead = "1011B Apostolico Now EIHA"

        a="eyJ0eXAiOiJKV1QiLCJub25jZSI6InQwQVBtYlIwMTNoelY1S0dOOGxaV2h0SnBUaWJvaGN0Y3V2Y1FaUGlIRlEiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81YzQ2NDlmOC04MGM2LTRhMTItODEwNy01ZGQ3ZTZlY2QyNzcvIiwiaWF0IjoxNjgzMjM2MTM4LCJuYmYiOjE2ODMyMzYxMzgsImV4cCI6MTY4MzMyMjgzOCwiYWNjdCI6MCwiYWNyIjoiMSIsImFpbyI6IkFZUUFlLzhUQUFBQVRDVlpBa3lPT1RxZ3M0RE5CRzBPY21ZQXcyaVlBOC94d3lMd3NEaWpVUGZmM2YwbVYreEpoOTYxYTZJZmkxUFgxbzVFTzlGaWVuK2w4V3RDMUd0TzNQYVBGeC8za2RjVGRFRXRrbnFKOUdqUThhYUxqSkZLSDEzbmJsMXBld2JDTTd2dDZkRGNEZytCTzg5NFlLQXhYVWJRbXlyVW9MZ09LNFRaWWs1c0UwRT0iLCJhbXIiOlsicnNhIiwibWZhIl0sImFwcF9kaXNwbGF5bmFtZSI6IkdyYXBoIEV4cGxvcmVyIiwiYXBwaWQiOiJkZThiYzhiNS1kOWY5LTQ4YjEtYThhZC1iNzQ4ZGE3MjUwNjQiLCJhcHBpZGFjciI6IjAiLCJjYXBvbGlkc19sYXRlYmluZCI6WyJhNTZkN2JjMC01ODQwLTQ0N2EtODJhNS1jM2VhYjA2YjdkMjgiXSwiZGV2aWNlaWQiOiJjMTk3ZDcxMS03OTkxLTQwMjMtYmVhZC1iMjhjMmE1YTBjMzIiLCJmYW1pbHlfbmFtZSI6IlBvbGFuY28iLCJnaXZlbl9uYW1lIjoiSm9zZSIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjY5LjExNy4yMDguMTkzIiwibmFtZSI6Ikpvc2UgUG9sYW5jbyIsIm9pZCI6IjllNWIzMzlmLWI0ZmMtNDIzMi1hZDM3LWI0M2FhNGE4YWE2ZiIsIm9ucHJlbV9zaWQiOiJTLTEtNS0yMS02NTAwODIxNDEtMTkyMTQwMDk3NS0zMzAwODc5MjA5LTM3MTEiLCJwbGF0ZiI6IjMiLCJwdWlkIjoiMTAwMzIwMDFBNDNEN0ZCMyIsInJoIjoiMC5BVkVBLUVsR1hNYUFFa3FCQjEzWDV1elNkd01BQUFBQUFBQUF3QUFBQUFBQUFBQlJBTVkuIiwic2NwIjoiQXVkaXRMb2cuUmVhZC5BbGwgRGV2aWNlTWFuYWdlbWVudE1hbmFnZWREZXZpY2VzLlJlYWQuQWxsIERldmljZU1hbmFnZW1lbnRNYW5hZ2VkRGV2aWNlcy5SZWFkV3JpdGUuQWxsIERpcmVjdG9yeS5SZWFkLkFsbCBGaWxlcy5SZWFkIEZpbGVzLlJlYWQuQWxsIEZpbGVzLlJlYWRXcml0ZSBGaWxlcy5SZWFkV3JpdGUuQWxsIG9wZW5pZCBwcm9maWxlIFNpdGVzLk1hbmFnZS5BbGwgU2l0ZXMuUmVhZC5BbGwgU2l0ZXMuUmVhZFdyaXRlLkFsbCBVc2VyLlJlYWQgZW1haWwiLCJzaWduaW5fc3RhdGUiOlsiZHZjX21uZ2QiLCJkdmNfY21wIiwia21zaSJdLCJzdWIiOiJkY0M1aklqOEY1QV9rREltUVRGSldZdWZFVXpaY1J6bGVnOUJfMU1ENkhjIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6Ik5BIiwidGlkIjoiNWM0NjQ5ZjgtODBjNi00YTEyLTgxMDctNWRkN2U2ZWNkMjc3IiwidW5pcXVlX25hbWUiOiJqb3NlLnBvbGFuY29AdGFycnl0b3duZXhwb2NhcmUuY29tIiwidXBuIjoiam9zZS5wb2xhbmNvQHRhcnJ5dG93bmV4cG9jYXJlLmNvbSIsInV0aSI6IndOdnhzN0xMaVVlb1NtVG9jRjhOQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbImI3OWZiZjRkLTNlZjktNDY4OS04MTQzLTc2YjE5NGU4NTUwOSJdLCJ4bXNfY2MiOlsiQ1AxIl0sInhtc19zc20iOiIxIiwieG1zX3N0Ijp7InN1YiI6Ijd2TDRWTVpHNGhmLUdUQURXMUgxdDR3TzVudXk4VkwxWXJhakJNcEZJSkUifSwieG1zX3RjZHQiOjE1ODM5MzM1MDV9.gE0DNY_8grf8oHNA66kzpH9WZ11JsdrP0Y9uUtnZGaileZ9VYfYWp4B_Ui4gJC3GjfHH20HT01HRn2mPqz3HEN-qLch8BgS6vy45V_wujNhvOlvw-vhHOLnplHhkiZjZLA0u6rQZQRRv1hLeo2HQ0dFOaU6XqK1GbI7t1ABn2zmSHvmhzYEgPNGHPYG_-GpZiUJxFDB-wDxju5Lzl0wNw4XMgii_bExM1OQ37pxnDNL4a6_nhtL23K0taaumuwppoeZxVz1w55YjCViyeU-RBA3qLwVaO-NpFcgIXEIy-kklUGS9Umt6Hw-FhTVjtgeAhXQWkCLbCY6vyp_T_UZecw"
       


        get_str = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/tables/table1/rows" #add
        encoded = URI::DEFAULT_PARSER.escape(get_str)

        response = HTTParty.get("#{encoded}",
          :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )          
                    
        response["value"].each do |r|       

          r["values"].each do |v|
           
            if v[1] == lead
              pp v[1]
              puts index=r["index"]
              total=index + 2 

              str = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/range(address='A#{total}:T#{total}')/delete" # patch
              encoded = URI::DEFAULT_PARSER.escape(str)

              os='"Onboarding - Sales"'
              op='"Onboarding - In Progress"'
              oc = '"Onboarding - Complete"'
              y='"Y"'
              n='"N"'

          response2 = HTTParty.post("#{encoded}",
            :body => {  "values"=>
              [
                ["Kathy Brown / Nanette Wrobel", "1011A Apostolico Now EIHA", "", 
                "Sales - Initial Communication", "NJ", "NY", 300, 0.60, 44166,
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

            end
            

           end           

          
         
           

        end
        
        # str = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/range(address='A378:T378')" # patch
        
        # encoded = URI::DEFAULT_PARSER.escape(str)
        # # puts encoded  
        # a="eyJ0eXAiOiJKV1QiLCJub25jZSI6InQwQVBtYlIwMTNoelY1S0dOOGxaV2h0SnBUaWJvaGN0Y3V2Y1FaUGlIRlEiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81YzQ2NDlmOC04MGM2LTRhMTItODEwNy01ZGQ3ZTZlY2QyNzcvIiwiaWF0IjoxNjgzMjM2MTM4LCJuYmYiOjE2ODMyMzYxMzgsImV4cCI6MTY4MzMyMjgzOCwiYWNjdCI6MCwiYWNyIjoiMSIsImFpbyI6IkFZUUFlLzhUQUFBQVRDVlpBa3lPT1RxZ3M0RE5CRzBPY21ZQXcyaVlBOC94d3lMd3NEaWpVUGZmM2YwbVYreEpoOTYxYTZJZmkxUFgxbzVFTzlGaWVuK2w4V3RDMUd0TzNQYVBGeC8za2RjVGRFRXRrbnFKOUdqUThhYUxqSkZLSDEzbmJsMXBld2JDTTd2dDZkRGNEZytCTzg5NFlLQXhYVWJRbXlyVW9MZ09LNFRaWWs1c0UwRT0iLCJhbXIiOlsicnNhIiwibWZhIl0sImFwcF9kaXNwbGF5bmFtZSI6IkdyYXBoIEV4cGxvcmVyIiwiYXBwaWQiOiJkZThiYzhiNS1kOWY5LTQ4YjEtYThhZC1iNzQ4ZGE3MjUwNjQiLCJhcHBpZGFjciI6IjAiLCJjYXBvbGlkc19sYXRlYmluZCI6WyJhNTZkN2JjMC01ODQwLTQ0N2EtODJhNS1jM2VhYjA2YjdkMjgiXSwiZGV2aWNlaWQiOiJjMTk3ZDcxMS03OTkxLTQwMjMtYmVhZC1iMjhjMmE1YTBjMzIiLCJmYW1pbHlfbmFtZSI6IlBvbGFuY28iLCJnaXZlbl9uYW1lIjoiSm9zZSIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjY5LjExNy4yMDguMTkzIiwibmFtZSI6Ikpvc2UgUG9sYW5jbyIsIm9pZCI6IjllNWIzMzlmLWI0ZmMtNDIzMi1hZDM3LWI0M2FhNGE4YWE2ZiIsIm9ucHJlbV9zaWQiOiJTLTEtNS0yMS02NTAwODIxNDEtMTkyMTQwMDk3NS0zMzAwODc5MjA5LTM3MTEiLCJwbGF0ZiI6IjMiLCJwdWlkIjoiMTAwMzIwMDFBNDNEN0ZCMyIsInJoIjoiMC5BVkVBLUVsR1hNYUFFa3FCQjEzWDV1elNkd01BQUFBQUFBQUF3QUFBQUFBQUFBQlJBTVkuIiwic2NwIjoiQXVkaXRMb2cuUmVhZC5BbGwgRGV2aWNlTWFuYWdlbWVudE1hbmFnZWREZXZpY2VzLlJlYWQuQWxsIERldmljZU1hbmFnZW1lbnRNYW5hZ2VkRGV2aWNlcy5SZWFkV3JpdGUuQWxsIERpcmVjdG9yeS5SZWFkLkFsbCBGaWxlcy5SZWFkIEZpbGVzLlJlYWQuQWxsIEZpbGVzLlJlYWRXcml0ZSBGaWxlcy5SZWFkV3JpdGUuQWxsIG9wZW5pZCBwcm9maWxlIFNpdGVzLk1hbmFnZS5BbGwgU2l0ZXMuUmVhZC5BbGwgU2l0ZXMuUmVhZFdyaXRlLkFsbCBVc2VyLlJlYWQgZW1haWwiLCJzaWduaW5fc3RhdGUiOlsiZHZjX21uZ2QiLCJkdmNfY21wIiwia21zaSJdLCJzdWIiOiJkY0M1aklqOEY1QV9rREltUVRGSldZdWZFVXpaY1J6bGVnOUJfMU1ENkhjIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6Ik5BIiwidGlkIjoiNWM0NjQ5ZjgtODBjNi00YTEyLTgxMDctNWRkN2U2ZWNkMjc3IiwidW5pcXVlX25hbWUiOiJqb3NlLnBvbGFuY29AdGFycnl0b3duZXhwb2NhcmUuY29tIiwidXBuIjoiam9zZS5wb2xhbmNvQHRhcnJ5dG93bmV4cG9jYXJlLmNvbSIsInV0aSI6IndOdnhzN0xMaVVlb1NtVG9jRjhOQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbImI3OWZiZjRkLTNlZjktNDY4OS04MTQzLTc2YjE5NGU4NTUwOSJdLCJ4bXNfY2MiOlsiQ1AxIl0sInhtc19zc20iOiIxIiwieG1zX3N0Ijp7InN1YiI6Ijd2TDRWTVpHNGhmLUdUQURXMUgxdDR3TzVudXk4VkwxWXJhakJNcEZJSkUifSwieG1zX3RjZHQiOjE1ODM5MzM1MDV9.gE0DNY_8grf8oHNA66kzpH9WZ11JsdrP0Y9uUtnZGaileZ9VYfYWp4B_Ui4gJC3GjfHH20HT01HRn2mPqz3HEN-qLch8BgS6vy45V_wujNhvOlvw-vhHOLnplHhkiZjZLA0u6rQZQRRv1hLeo2HQ0dFOaU6XqK1GbI7t1ABn2zmSHvmhzYEgPNGHPYG_-GpZiUJxFDB-wDxju5Lzl0wNw4XMgii_bExM1OQ37pxnDNL4a6_nhtL23K0taaumuwppoeZxVz1w55YjCViyeU-RBA3qLwVaO-NpFcgIXEIy-kklUGS9Umt6Hw-FhTVjtgeAhXQWkCLbCY6vyp_T_UZecw"
       
        # response = HTTParty.get("#{encoded}",
        #   :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )        
               
        # response = HTTParty.get("#{encoded}",
        #   :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )        
        
          # total = response["value"].size + 2

          # total = 
          # puts total

          # pp response 

          os='"Onboarding - Sales"'
          op='"Onboarding - In Progress"'
          oc = '"Onboarding - Complete"'
          y='"Y"'
          n='"N"'
                   
      #  response2 = HTTParty.patch("#{encoded}",
      #   :body => 
      #     {  "values"=>[
      #       ["Kathy Brown / Nanette Wrobel", "1011A Apostolico Now EIHA", "", 
      #       "Sales - Initial Communication", "NJ", "NJ", 100, 0.75, 44166,
      #       "PAL", "", "", "", "",
      #       "=IFERROR(EDATE(I#{total},-1),"")", 
      #       "=EDATE(I#{total},1)",
      #       "=VLOOKUP(I#{total},Date_Lookups[#All],14,FALSE)",
      #       "=VLOOKUP(I#{total},Date_Lookups[#All],6,FALSE)", 
      #       "=IF(D#{total}=#{os},#{y},IF(D#{total}=#{op},#{y},IF(D#{total}=#{oc},#{y},#{n})))" , 
      #       "=YEAR([@[Go Live'' Date]])"
      #       ]
      #     ]                     
                    
      #     }.to_json,

      #   :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )       

      # pp response2


      # str1 = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Sales Pipeline/pivotTables/refreshAll"
      # encoded = URI::DEFAULT_PARSER.escape(str1)
               
      # response3 = HTTParty.post("#{encoded}",      
      # :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )
            
      # pp response3    

        
        
      end
    end
  end