namespace :db do
    namespace :seed do
      desc "convert string to lower cas underscore"
      task play1: :environment do
        
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
        require 'geocoder'

        CSV.open("csv/support_inc_co_results1.csv", "a") do |fl|

          CSV.foreach("csv/support_inc_co_results.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row| 
            
            full = "#{row[0]} #{row[1]} #{row[2]}"  
          
            results = Geocoder.search(full)  
            
            # puts results
            lat = results.first.coordinates[0]
            lon = results.first.coordinates[1]

            puts lat 
            puts lon

            fl << row.values_at(*row.headers) + [lat] + [lon]

          end
        end


                   
      
       
        
        
      end
    end
  end