namespace :db do
  namespace :seed do
    desc "convert string to lower cas underscore"
    task hs_properties: :environment do
      
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
      
      require 'hubspot-api-client'     
      
      
     
     ##Create Properties in HubSpot API
      
    CSV.foreach("csv/webinar_props_feb_8_2024.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|
      
      name="#{row[0]} #{row[5]}".parameterize(separator: '_')
      puts name        
      label="#{row[1]} #{row[5]}"
      type=row[2]
      field_type=row[3]
      group_name=row[4]
      # puts row[5]
      object_type=row[6]
      
      
      if row[2] == "string"
        api_client = Hubspot::Client.new(access_token: ENV["HUBSPOT_API_KEY"])
        body = {name: name, label: label, type: type, fieldType: field_type, groupName: group_name, has_unique_value: false, hidden: false, formField: true}
        api_response = api_client.crm.properties.core_api.create(object_type: object_type, body: body)
        puts api_response
      elsif row[2] == "enumeration"
        api_client = Hubspot::Client.new(access_token: ENV["HUBSPOT_API_KEY"])
        body = {name: name, label: label, type: type, fieldType: field_type, groupName: group_name,
          options: [{"label":"1","description":"","value":"1","displayOrder":1,"hidden":false,"formField":true},
            {"label":"2","description":"","value":"2","displayOrder":2,"hidden":false,"formField":true},
            {"label":"3","description":"","value":"3","displayOrder":3,"hidden":false,"formField":true},
            {"label":"4","description":"","value":"4","displayOrder":4,"hidden":false,"formField":true},
            {"label":"5","description":"","value":"5","displayOrder":5,"hidden":false,"formField":true}
            ], has_unique_value: false, hidden: false, formField: true}
        api_response = api_client.crm.properties.core_api.create(object_type: object_type, body: body)
        puts api_response
      end
      
    
    end
    
  
      
      
    end
  end
end