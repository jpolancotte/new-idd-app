require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
# require 'mechanize'

CSV.open("csv/portal3_result.csv", "a") do |fl|
  CSV.foreach("csv/portal2.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|

    email = row[2]

   a= "@tarrytownexpocare.com"

   if email.include?(a)

   puts email

   else

   fl << row.values_at(*row.headers)

   end
  #  puts a

  #  if row[2].include?(email)

  #   fl << row.values_at(*row.headers)

  #  end

       
   

  	
  	
  	# fn=row[2].split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") if row[2]
  	# ln=row[3].split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") if row[3]
  	
	 
	  
	#   if email.include?(a)
	#   	fl << row.values_at(*row.headers) + [email]
	#   else 	
	#   	fl << row.values_at(*row.headers) 
	#   end

    
   
  end 
end