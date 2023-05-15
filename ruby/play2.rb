require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
# require 'mechanize'

CSV.open("csv/ce_cert_results.csv", "a") do |fl|
    CSV.foreach("csv/ce_cert.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
        numb=row[0]
        first=row[1]
        last=row[2]
        
        first=first.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
        last=last.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
        
        full_name = "#{first} #{last}"
        
        file_name = "#{numb}-#{first}-#{last}-May-11-2023-Webinar-CEU-Certificate"      
        
        
        url="https://20711908.fs1.hubspotusercontent-na1.net/hubfs/20711908/May%2011%202023%20Customer%20Webinar/Certificates/#{file_name}.pdf"
        
        
        fl << row.values_at(*row.headers) + [first] + [last] + [full_name] + [file_name] + [url]
    
    end 
end
