require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
require 'geocoder'



CSV.open("csv/oak_results.csv", "a") do |fl|
    CSV.foreach("csv/oaklist.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
        # add=row[4]
        # city=row[5]
        # state=row[6]
        full="#{row[4]} #{row[5]} #{row[6]}"

        results = Geocoder.search(full)
        lat=results.first.coordinates[0] if results.first.coordinates[0]
        lon=results.first.coordinates[1] if results.first.coordinates[1]

        puts full
        puts lat 
        puts lon

     fl << row.values_at(*row.headers) + [lat] + [lon]
    end 
end

