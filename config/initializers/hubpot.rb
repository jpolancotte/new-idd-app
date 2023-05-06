# config/initializers/hubspot.rb
HubspotEvent.client_secret = ENV["2937e9af-9dce-4977-a31a-2ecc53dea87a"]

HubspotEvent.configure do |events|
  events.subscribe 'deal.propertyChange' do |event|
    event["subscriptionType"]   #=> "company.propertyChange"
    event["portalId"]           #=> 123456
    event["objectId"]           #=> 182393
    event["propertyName"]       #=> "hubspot_owner_id"
    event["propertyValue"]      #=> 123
  end

  events.all do |event|
    # Handle all event types
  end
end