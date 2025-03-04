require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
# require 'mechanize'

CSV.open("csv/tx_2025_sympo_results.csv", "a") do |fl|
  CSV.foreach("csv/tx_2025_sympo.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
    a=row[0].to_s
    b=row[1].to_s
    c = "001"
    first=row[4]
    last=row[5]

    d = "#{a}#{b}#{c}" 
   
    

    # full_name =row[0]

    # first=full_name.split(" ")[0]
    # last=full_name.split(" ")[1]
    
    first=first.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
    last=last.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
    
    # full_name = "#{first} #{last}"
    
    # file_name = "#{numb}-#{first}-#{last}-NC-Feb-20-2025-Symposium-CEU-Certificate"     

    # url="https://20711908.fs1.hubspotusercontent-na1.net/hubfs/20711908/2025%20Symposiums/NC%20Feb%2020%202025/Certificates/#{file_name}.pdf"
  
    fl << row.values_at(*row.headers) + [first] + [last] + [d]

    # fl << row.values_at(*row.headers) + [first] + [last] + [full_name]

    # fl << row.values_at(*row.headers) + [first] + [last] + [full_name]

  end 
end




  