require 'open-uri'
require 'date'
require 'uri'
require 'net/http'
require 'json'
require 'csv'
require 'pp'
# require 'mechanize'

content = File.read('csv/inlist.csv')
rows = CSV.parse(content, headers: false)

puts rows.size
r1=0
r2=6

loop do 

  csv = rows[r1..r2]

  CSV.open("csv/inlist_results.csv", "a") do |fl|

    a = csv[0].join(", ") 
    b = csv[1].join(", ") 
    c = csv[2].join(", ") 
    d = csv[3].join(", ") 
  
    e = csv[4].join(", ") 
    f = csv[5].join(", ") 
    g = csv[6].join(", ") 
  
    fl <<  [a] + [b] + [c] + [d] + [e] + [f] + [g]
  
  end

  r1 += 8
  r2 += 8

  puts r1
  puts r2

  break if r2 > 3491

end

# rows = csv.first(7)
# rows = csv[0..6]

# rows = csv[8..14]

# rows = csv[16..22]


# puts rows


# CSV.open("csv/inlist_results.csv", "a") do |fl|

#   a = csv[0].join(", ") 
#   b = csv[1].join(", ") 
#   c = csv[2].join(", ") 
#   d = csv[3].join(", ") 

#   e = csv[4].join(", ") 
#   f = csv[5].join(", ") 
#   g = csv[6].join(", ") 

#   fl <<  [a] + [b] + [c] + [d] + [e] + [f] 

# end

# csv.each do |row|

#   # puts row

# end



# CSV.open("csv/interhab_result3.csv", "a") do |fl|
  # a = CSV.foreach("csv/inlist.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|

  # puts full=row[0]

  #  a=full.transpose

  #  puts a

  #  if full
  #   puts full
  #  else
  #   puts "Blank"

  #  end
   


    # fl << row.values_at(*row.headers) + [first] + [last] + [url] 
  
  #end 


#end




# CSV.open("csv/interhab_result3.csv", "a") do |fl|
#     CSV.foreach("csv/interhab3.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|

#      puts full=row[1]
#      f=full.split(" ")[0]
#      l=full.split(" ")[1]

#      puts f
#      puts l
  
#       first=f.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 
#       last=l.split.map{ |part| part.split("-").map{ |p| p.capitalize }.join("-") }.join(" ") 

#       domain=row[3]
#       url=domain.split("@")[1]
  
  
#       fl << row.values_at(*row.headers) + [first] + [last] + [url] 
    
#     end 
# end


# CSV.open("csv/interhab_result3.csv", "a") do |fl|
#   CSV.foreach("csv/interhab3.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|

#     fn = row[2]

#     full=fn.split(", ")

#    full.each do |a|


#     fl << row.values_at(*row.headers) + [a] 

#    end


   
# #    fl << row.values_at(*row.headers) + [full] 

#   end 
# end