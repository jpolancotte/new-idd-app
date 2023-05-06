namespace :db do
    namespace :seed do
      desc "convert string to lower cas underscore"
      task excel_api: :environment do
        
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

        # /me/drive/items/{id}/workbook/worksheets/{id|name}/cell(row={row},column={column})

        #str = "https://graph.microsoft.com/v1.0/me/drive/items/01OPZEJ6PLMYAKD65ODNHL6TX6YGUBW7N2/workbook/worksheets('Master Data')/cell(row=376,column=2)"
        
        
        #str="https://graph.microsoft.com/v1.0/me/drive/root:/jpnow.xlsx:/workbook/worksheets?$select=name"

       
        #str="https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/usedRange"


        #str = "https://graph.microsoft.com/v1.0/me/drive/items/01OPZEJ6PLMYAKD65ODNHL6TX6YGUBW7N2/workbook/worksheets('Master Data')"

        #str = "https://graph.microsoft.com/v1.0/me/drive/items/01OPZEJ6PLMYAKD65ODNHL6TX6YGUBW7N2/workbook/tables/table1" #tables

        #str = "https://graph.microsoft.com/v1.0/me/drive/items/01OPZEJ6PLMYAKD65ODNHL6TX6YGUBW7N2/workbook/worksheets('Master Data')/row=376"


        str = "https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/tables/table1/rows/"
        encoded = URI::DEFAULT_PARSER.escape(str)
        # puts encoded 

                
       a="eyJ0eXAiOiJKV1QiLCJub25jZSI6InQwQVBtYlIwMTNoelY1S0dOOGxaV2h0SnBUaWJvaGN0Y3V2Y1FaUGlIRlEiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81YzQ2NDlmOC04MGM2LTRhMTItODEwNy01ZGQ3ZTZlY2QyNzcvIiwiaWF0IjoxNjgzMjM2MTM4LCJuYmYiOjE2ODMyMzYxMzgsImV4cCI6MTY4MzMyMjgzOCwiYWNjdCI6MCwiYWNyIjoiMSIsImFpbyI6IkFZUUFlLzhUQUFBQVRDVlpBa3lPT1RxZ3M0RE5CRzBPY21ZQXcyaVlBOC94d3lMd3NEaWpVUGZmM2YwbVYreEpoOTYxYTZJZmkxUFgxbzVFTzlGaWVuK2w4V3RDMUd0TzNQYVBGeC8za2RjVGRFRXRrbnFKOUdqUThhYUxqSkZLSDEzbmJsMXBld2JDTTd2dDZkRGNEZytCTzg5NFlLQXhYVWJRbXlyVW9MZ09LNFRaWWs1c0UwRT0iLCJhbXIiOlsicnNhIiwibWZhIl0sImFwcF9kaXNwbGF5bmFtZSI6IkdyYXBoIEV4cGxvcmVyIiwiYXBwaWQiOiJkZThiYzhiNS1kOWY5LTQ4YjEtYThhZC1iNzQ4ZGE3MjUwNjQiLCJhcHBpZGFjciI6IjAiLCJjYXBvbGlkc19sYXRlYmluZCI6WyJhNTZkN2JjMC01ODQwLTQ0N2EtODJhNS1jM2VhYjA2YjdkMjgiXSwiZGV2aWNlaWQiOiJjMTk3ZDcxMS03OTkxLTQwMjMtYmVhZC1iMjhjMmE1YTBjMzIiLCJmYW1pbHlfbmFtZSI6IlBvbGFuY28iLCJnaXZlbl9uYW1lIjoiSm9zZSIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjY5LjExNy4yMDguMTkzIiwibmFtZSI6Ikpvc2UgUG9sYW5jbyIsIm9pZCI6IjllNWIzMzlmLWI0ZmMtNDIzMi1hZDM3LWI0M2FhNGE4YWE2ZiIsIm9ucHJlbV9zaWQiOiJTLTEtNS0yMS02NTAwODIxNDEtMTkyMTQwMDk3NS0zMzAwODc5MjA5LTM3MTEiLCJwbGF0ZiI6IjMiLCJwdWlkIjoiMTAwMzIwMDFBNDNEN0ZCMyIsInJoIjoiMC5BVkVBLUVsR1hNYUFFa3FCQjEzWDV1elNkd01BQUFBQUFBQUF3QUFBQUFBQUFBQlJBTVkuIiwic2NwIjoiQXVkaXRMb2cuUmVhZC5BbGwgRGV2aWNlTWFuYWdlbWVudE1hbmFnZWREZXZpY2VzLlJlYWQuQWxsIERldmljZU1hbmFnZW1lbnRNYW5hZ2VkRGV2aWNlcy5SZWFkV3JpdGUuQWxsIERpcmVjdG9yeS5SZWFkLkFsbCBGaWxlcy5SZWFkIEZpbGVzLlJlYWQuQWxsIEZpbGVzLlJlYWRXcml0ZSBGaWxlcy5SZWFkV3JpdGUuQWxsIG9wZW5pZCBwcm9maWxlIFNpdGVzLk1hbmFnZS5BbGwgU2l0ZXMuUmVhZC5BbGwgU2l0ZXMuUmVhZFdyaXRlLkFsbCBVc2VyLlJlYWQgZW1haWwiLCJzaWduaW5fc3RhdGUiOlsiZHZjX21uZ2QiLCJkdmNfY21wIiwia21zaSJdLCJzdWIiOiJkY0M1aklqOEY1QV9rREltUVRGSldZdWZFVXpaY1J6bGVnOUJfMU1ENkhjIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6Ik5BIiwidGlkIjoiNWM0NjQ5ZjgtODBjNi00YTEyLTgxMDctNWRkN2U2ZWNkMjc3IiwidW5pcXVlX25hbWUiOiJqb3NlLnBvbGFuY29AdGFycnl0b3duZXhwb2NhcmUuY29tIiwidXBuIjoiam9zZS5wb2xhbmNvQHRhcnJ5dG93bmV4cG9jYXJlLmNvbSIsInV0aSI6IndOdnhzN0xMaVVlb1NtVG9jRjhOQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbImI3OWZiZjRkLTNlZjktNDY4OS04MTQzLTc2YjE5NGU4NTUwOSJdLCJ4bXNfY2MiOlsiQ1AxIl0sInhtc19zc20iOiIxIiwieG1zX3N0Ijp7InN1YiI6Ijd2TDRWTVpHNGhmLUdUQURXMUgxdDR3TzVudXk4VkwxWXJhakJNcEZJSkUifSwieG1zX3RjZHQiOjE1ODM5MzM1MDV9.gE0DNY_8grf8oHNA66kzpH9WZ11JsdrP0Y9uUtnZGaileZ9VYfYWp4B_Ui4gJC3GjfHH20HT01HRn2mPqz3HEN-qLch8BgS6vy45V_wujNhvOlvw-vhHOLnplHhkiZjZLA0u6rQZQRRv1hLeo2HQ0dFOaU6XqK1GbI7t1ABn2zmSHvmhzYEgPNGHPYG_-GpZiUJxFDB-wDxju5Lzl0wNw4XMgii_bExM1OQ37pxnDNL4a6_nhtL23K0taaumuwppoeZxVz1w55YjCViyeU-RBA3qLwVaO-NpFcgIXEIy-kklUGS9Umt6Hw-FhTVjtgeAhXQWkCLbCY6vyp_T_UZecw"
               
        response = HTTParty.get("#{encoded}",
        # :body => 
        #         {
        #     "name": "#{name}",
        #     "label": "#{label}",
        #     "description": "#{label}",
        #     "groupName": "#{groupName}",
        #     "type": "string",
        #     "fieldType": "text",
        #     "formField": true,
        #     "displayOrder": 6,
        #     "options": []
        # }.to_json,
        :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )

        
        
       pp response
      
       
        
        
      end
    end
  end