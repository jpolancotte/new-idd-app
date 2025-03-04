namespace :db do
    namespace :seed do
      desc "Seed Rescare Location data"
      task rescare: :environment do
        
        # CSV.foreach('csv/hs_contacts_updated.csv', :headers => true) do |row|
        
        CSV.foreach('csv/rescare.csv', headers: true, encoding:'iso-8859-1:utf-8') do |row|
           
        # CSV.foreach('csv/hs_contacts.csv', :headers => true) do |row|
            
           name = row[0]
           address = row[1]
           city = row[2]
           state = row[3]
           zip = row[4] 
           services = row[5]   
           phone = row[6]
           counties_served = row[7]    
            
            c = Rescare.new
              c.name=name 
              c.address=address 
              c.city=city
              c.state=state
              c.zip=zip 
              c.services=services
              c.phone=phone
              c.counties_served=counties_served
            c.save
       
        end
      end
    end
  end