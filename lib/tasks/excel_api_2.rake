namespace :db do
    namespace :seed do
      desc "convert string to lower cas underscore"
      task excel_api_2: :environment do
        
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
        
        
        str="https://graph.microsoft.com/v1.0/me/drive/root:/jpnow.xlsx:/workbook/worksheets/JP/range(address='A1:B2')"
        #str="https://graph.microsoft.com/v1.0/me/drive/root:/jpnow.xlsx:/workbook/tables/Table1"

        #str="https://graph.microsoft.com/v1.0/me/drive/root:/jpnow.xlsx:/workbook/worksheets?$select=name"

       
        #str="https://graph.microsoft.com/v1.0/me/drive/root:/JP Pipleline TEST.xlsx:/workbook/worksheets/Master Data/usedRange"


        #str = "https://graph.microsoft.com/v1.0/me/drive/items/01OPZEJ6PLMYAKD65ODNHL6TX6YGUBW7N2/workbook/worksheets('Master Data')"

        #str = "https://graph.microsoft.com/v1.0/me/drive/items/01OPZEJ6PLMYAKD65ODNHL6TX6YGUBW7N2/workbook/tables/table1" #tables

        #str = "https://graph.microsoft.com/v1.0/me/drive/items/01OPZEJ6PLMYAKD65ODNHL6TX6YGUBW7N2/workbook/worksheets('Master Data')/row=376"


        #str = "https://graph.microsoft.com/v1.0/me/drive/items/01OPZEJ6PLMYAKD65ODNHL6TX6YGUBW7N2/workbook/worksheets/Master Data/tables/table1/rows/10"
        encoded = URI::DEFAULT_PARSER.escape(str)
        # puts encoded 


        
        a="eyJ0eXAiOiJKV1QiLCJub25jZSI6InF4T2FvWHVvRnZ3U2g0QlNlWjVoSV9vZXlzSmktd3gxNjA2UU1iRVVEc28iLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81YzQ2NDlmOC04MGM2LTRhMTItODEwNy01ZGQ3ZTZlY2QyNzcvIiwiaWF0IjoxNjgzMTQ5MzYwLCJuYmYiOjE2ODMxNDkzNjAsImV4cCI6MTY4MzIzNjA2MCwiYWNjdCI6MCwiYWNyIjoiMSIsImFpbyI6IkFZUUFlLzhUQUFBQTFjV0ZHS1hZY0R1ZTdUTGVBS0RsdVNqMkczUENoWkc5R1I1Z0ZBcjZFYkF1OUo3NnR4ODhSTmREQjlTTlBTZXlLN3FPck0ybkdvWEJUUEhubnY5ZThqVEZIK3JTVUZ0bGxzRTNheXlmbnUyZXhjVFk2YjdMZzQ5VGhMd2ZjblE5NkJNSS9ReWJQMi93SzlhWlFkSk5Tb3lYUUVROEdOWVZ1cFM1RW5yMEw2ST0iLCJhbXIiOlsicnNhIiwibWZhIl0sImFwcF9kaXNwbGF5bmFtZSI6IkdyYXBoIEV4cGxvcmVyIiwiYXBwaWQiOiJkZThiYzhiNS1kOWY5LTQ4YjEtYThhZC1iNzQ4ZGE3MjUwNjQiLCJhcHBpZGFjciI6IjAiLCJjYXBvbGlkc19sYXRlYmluZCI6WyJhNTZkN2JjMC01ODQwLTQ0N2EtODJhNS1jM2VhYjA2YjdkMjgiXSwiZGV2aWNlaWQiOiJjMTk3ZDcxMS03OTkxLTQwMjMtYmVhZC1iMjhjMmE1YTBjMzIiLCJmYW1pbHlfbmFtZSI6IlBvbGFuY28iLCJnaXZlbl9uYW1lIjoiSm9zZSIsImlkdHlwIjoidXNlciIsImlwYWRkciI6IjY5LjExNy4yMDguMTkzIiwibmFtZSI6Ikpvc2UgUG9sYW5jbyIsIm9pZCI6IjllNWIzMzlmLWI0ZmMtNDIzMi1hZDM3LWI0M2FhNGE4YWE2ZiIsIm9ucHJlbV9zaWQiOiJTLTEtNS0yMS02NTAwODIxNDEtMTkyMTQwMDk3NS0zMzAwODc5MjA5LTM3MTEiLCJwbGF0ZiI6IjMiLCJwdWlkIjoiMTAwMzIwMDFBNDNEN0ZCMyIsInJoIjoiMC5BVkVBLUVsR1hNYUFFa3FCQjEzWDV1elNkd01BQUFBQUFBQUF3QUFBQUFBQUFBQlJBTVkuIiwic2NwIjoiQXVkaXRMb2cuUmVhZC5BbGwgRGV2aWNlTWFuYWdlbWVudE1hbmFnZWREZXZpY2VzLlJlYWQuQWxsIERldmljZU1hbmFnZW1lbnRNYW5hZ2VkRGV2aWNlcy5SZWFkV3JpdGUuQWxsIERpcmVjdG9yeS5SZWFkLkFsbCBGaWxlcy5SZWFkIEZpbGVzLlJlYWQuQWxsIEZpbGVzLlJlYWRXcml0ZSBGaWxlcy5SZWFkV3JpdGUuQWxsIG9wZW5pZCBwcm9maWxlIFNpdGVzLk1hbmFnZS5BbGwgU2l0ZXMuUmVhZC5BbGwgU2l0ZXMuUmVhZFdyaXRlLkFsbCBVc2VyLlJlYWQgZW1haWwiLCJzaWduaW5fc3RhdGUiOlsiZHZjX21uZ2QiLCJkdmNfY21wIiwia21zaSJdLCJzdWIiOiJkY0M1aklqOEY1QV9rREltUVRGSldZdWZFVXpaY1J6bGVnOUJfMU1ENkhjIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6Ik5BIiwidGlkIjoiNWM0NjQ5ZjgtODBjNi00YTEyLTgxMDctNWRkN2U2ZWNkMjc3IiwidW5pcXVlX25hbWUiOiJqb3NlLnBvbGFuY29AdGFycnl0b3duZXhwb2NhcmUuY29tIiwidXBuIjoiam9zZS5wb2xhbmNvQHRhcnJ5dG93bmV4cG9jYXJlLmNvbSIsInV0aSI6InZLWm82UHg3bms2aUo4c2pBU2dHQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbImI3OWZiZjRkLTNlZjktNDY4OS04MTQzLTc2YjE5NGU4NTUwOSJdLCJ4bXNfY2MiOlsiQ1AxIl0sInhtc19zc20iOiIxIiwieG1zX3N0Ijp7InN1YiI6Ijd2TDRWTVpHNGhmLUdUQURXMUgxdDR3TzVudXk4VkwxWXJhakJNcEZJSkUifSwieG1zX3RjZHQiOjE1ODM5MzM1MDV9.rdK7rE2lXGblARcdEnWGvhm2qH8kLt153AwczTxR7X-Ey6b1C2ljOGrQx6DLqogHoEw2bJi1fZAFMNoKuu68DnjLjv6ezyN2oRMqsPol5OpJJJ9iWhWdB2t07vXtRDlxnOkOo8D5pVsdmTt3DRjTozR66C6pS65U5yjprrW0G8YiUQZLf9F_un6tanueRAxNgnru1e3kiH4jUNFCjAOIBDWzAmFIBHpBP5iwfQhAopQJzxHifMbouqrVUE-umQUoP-4QzCfrq6Ol__2-kHhju-HiEBLLq9HLcGRpkL6In3bFWq5WrPMyb1FQV2Vjtp2TxLs4YGuvm-g94ZsmNamQMQ"

               
        response = HTTParty.patch("#{encoded}",
        :body => 
        {
          "values" => [["Hello", "100"],["1/1/2016", "#{nil}"]],
          "formulas" =>  [["#{nil}", "#{nil}"], ["#{nil}", "=IFERROR(EDATE(A2,-1),"")"]],
          "numberFormat" =>  [["#{nil}","#{nil}"], ["m-ddd", "#{nil}"]]
      }.to_json,

        :headers => {'Content-Type' => 'application/json', "Authorization" => "Bearer #{a}" } )

        
        
       pp response
      
       
        
        
      end
    end
  end