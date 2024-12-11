require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
# require 'mechanize'

CSV.open("csv/arc_list_result.csv", "a") do |fl|
  CSV.foreach("csv/arc_list.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|

    full=row[0]

    fn=full.split(", ")[0]
    ln=full.split(", ")[1]

    puts fn
    puts ln

  	fn=fn.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") if row[2]
  	ln=ln.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") if row[3]


     fl << row.values_at(*row.headers) + [fn] + [ln]



       
     	
  	
	 
	  
	#   if email.include?(a)
	#   	fl << row.values_at(*row.headers) + [email]
	#   else 	
	#   	fl << row.values_at(*row.headers) 
	#   end

    
   
  end 
end