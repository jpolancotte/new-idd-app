require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
# require 'mechanize'

CSV.open("csv/list2_results.csv", "a") do |fl|
  CSV.foreach("csv/list2.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|

    full=row[0]
    first=full.split(" ")[0]

    last=full.split(' ')[1..-1].join(' ')


    puts full


    fl << row.values_at(*row.headers) + [first] + [last] + [full]
   

  	
  	
  	# fn=row[2].split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") if row[2]
  	# ln=row[3].split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") if row[3]
  	
	 
	  
	#   if email.include?(a)
	#   	fl << row.values_at(*row.headers) + [email]
	#   else 	
	#   	fl << row.values_at(*row.headers) 
	#   end

    
   
  end 
end