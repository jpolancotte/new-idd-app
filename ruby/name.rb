require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
# require 'mechanize'

CSV.open("csv/feb25_results.csv", "a") do |fl|
  CSV.foreach("csv/feb25.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
    numb=row[0]
    first=row[1]
    last=row[2]

    # full_name =row[0]

    # first=full_name.split(" ")[0]
    # last=full_name.split(" ")[1]
    
    first=first.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
    last=last.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
    
    full_name = "#{first} #{last}"
    
    file_name = "#{numb}-#{first}-#{last}-Feb-13-2025-Customer-Webinar-CEU-Certificate" 

    url="https://20711908.fs1.hubspotusercontent-na1.net/hubfs/20711908/2025%20Webinars/Feb%2013%202025/Certificates/#{file_name}.pdf"
  
    fl << row.values_at(*row.headers) + [first] + [last] + [full_name] + [file_name] + [url]

    # fl << row.values_at(*row.headers) + [first] + [last] + [full_name]

    # fl << row.values_at(*row.headers) + [first] + [last] + [full_name]

  end 
end




  