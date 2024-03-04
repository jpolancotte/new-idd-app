require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
# require 'mechanize'

CSV.open("csv/knox_results.csv", "a") do |fl|
  CSV.foreach("csv/knox.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
    numb=row[0]
    first=row[1]
    last=row[2]
    
    first=first.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
    last=last.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
    
    full_name = "#{first} #{last}"
    
    file_name = "#{numb}-#{first}-#{last}-Feb-20-2024-Meal-Program-CEU-Certificate" 
    
    url="https://20711908.fs1.hubspotusercontent-na1.net/hubfs/20711908/2024%20Meal%20Programs/Feb%2020%20Knoxville%20TN/#{file_name}.pdf"

    
  
    fl << row.values_at(*row.headers) + [first] + [last] + [full_name] + [file_name] + [url]

  end 
end




  