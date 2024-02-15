require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'


CSV.open("csv/njproviders_results.csv", "a") do |fl|
    CSV.foreach("csv/njproviders.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
        
        email = row[0]
        url=email.split("@")
        domain=url[1]

        fl << row.values_at(*row.headers) + [domain]
    end 
end





