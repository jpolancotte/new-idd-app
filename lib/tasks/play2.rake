namespace :db do
    namespace :seed do
      desc "convert string to lower cas underscore"
      task play2: :environment do
        
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

        #generate qr-codes
        require 'rqrcode' 


        #decode qr-codes
        require 'qrio'


        qr_data = Qrio::Qr.load("https://qr.simpleevents.io/image2/3381/MzM4MS1JbmRpYW5hIDIwMjUgU3ltcG9zaXVtIA--/3720051")

        puts qr_data  

      #   qr = RQRCode::QRCode.new("https://qr.simpleevents.io/image2/3381/MzM4MS1JbmRpYW5hIDIwMjUgU3ltcG9zaXVtIA--/3720051") 
      # puts qr
        # puts "Decoded QR data: #{decoded_data}" 



                  
      
       
        
        
      end
    end
  end