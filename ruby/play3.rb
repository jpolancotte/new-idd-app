require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
# require 'mechanize'



# CSV.open("csv/list_kn_results.csv", "a") do |fl|
    # CSV.foreach("csv/marf.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
    #     pp a=row[0]
    #    puts b=a.split(",")
    #     name=b[0]
    #     city=b[1].strip
    #     state=b[2].strip
    #     site=b[3].strip
        
    #     fl << row.values_at(*row.headers) + [name] + [city] + [state] + [site]
    # end 
# end


# CSV.open("csv/list_kn_results.csv", "a") do |fl|
#     CSV.foreach("csv/list_kn_v2.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
#         a=row[0]
#        puts b=a.split(",")
#         name=b[0]
#         city=b[1].strip
#         state=b[2].strip
#         site=b[3].strip
        
#         fl << row.values_at(*row.headers) + [name] + [city] + [state] + [site]
#     end 
# end

CSV.open("csv/kylist_results.csv", "a") do |fl|
    CSV.foreach("csv/kylist.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
        numb=row[0]
        first=row[1]
        last=row[2]
        
        first=first.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
        last=last.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
        
        full_name = "#{first} #{last}"
        
        file_name = "#{numb}-#{first}-#{last}-Nov-16-2023-Webinar-CEU-Certificate"   

        url="https://20711908.fs1.hubspotusercontent-na1.net/hubfs/20711908/December%205%202023%20Symposium/Certificates/#{file_name}.pdf"
        
        fl << row.values_at(*row.headers) + [first] + [last] + [full_name] + [file_name] + [url]
    
    end 
end

