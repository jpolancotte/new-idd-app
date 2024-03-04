require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'


CSV.open("csv/schsp24_results.csv", "a") do |fl|
    CSV.foreach("csv/schsp24.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
        
       fn = row[0]
       a=fn.split(" ")
       f=a[0]
       l=a[1]

       first=f.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
       last=l.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 

        fl << row.values_at(*row.headers) + [first] + [last]
    end 
end





