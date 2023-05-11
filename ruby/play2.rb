require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
# require 'mechanize'

a={:id=>"13291859357", :properties=>{"comments"=>"My test again now today", "createdate"=>"2023-05-10T18:31:48.526Z", "dealname"=>"New Test Deal 2", "dealstage"=>"42683963", "delivery_type"=>"Deliver-to-home", "go_live_date"=>"2023-09-07", "hs_lastmodifieddate"=>"2023-05-11T19:25:38.485Z", "hs_object_id"=>"13291859357", "hubspot_owner_id"=>"126872114", "incumbent_pharmacy"=>"Hartzells", "pipeline_date"=>"2023-05-01", "probability_of_close"=>"37%", "state"=>"GA", "tte_servicing_pharmacy"=>"GA"}, :createdAt=>2023-05-10 18:31:48.526 UTC, :updatedAt=>2023-05-11 19:25:38.485 UTC, :archived=>false}

puts a[:id]

puts a[:properties]["comments"]

puts a[:properties]["dealstage"]
puts a[:properties]["incumbent_pharmacy"]