require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
# require 'mechanize'

skip=0


states.each do |state|

    loop do

    end
end


url="https://npiregistry.cms.hhs.gov/api/?taxonomy_description=Community%20Based%20Residential%20Treatment%20Facility,%20Intellectual%20and/or%20Developmental%20Disabilities&state=MO&limit=200&skip=1000&pretty=on&version=2.1"

uri = URI(url)
res = Net::HTTP.get_response(uri)
res.body if res.is_a?(Net::HTTPSuccess)

parsed_json = JSON.parse(res.body)

pp parsed_json["result_count"]

results = parsed_json["results"]

if results.size > 0

end

# results.each do |res|
# pp res["number"]
# end




# CSV.open("csv/august23cert_results.csv", "a") do |fl|
#     CSV.foreach("csv/august23cert.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
#         numb=row[0]
#         first=row[1]
#         last=row[2]
        
#         first=first.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
#         last=last.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
        
#         full_name = "#{first} #{last}"
        
#         file_name = "#{numb}-#{first}-#{last}-August-23-2023-CEU-Certificate"            

       
#         url="https://20711908.fs1.hubspotusercontent-na1.net/hubfs/20711908/August%2023%202023/Certificates/#{file_name}.pdf"
                
#         fl << row.values_at(*row.headers) + [first] + [last] + [full_name] + [file_name] + [url]
    
#     end 
# end


