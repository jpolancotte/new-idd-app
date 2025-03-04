namespace :db do
    namespace :seed do
      desc "Seed Pharmerica data"
      task pharmerica_pharmacies: :environment do
        
        # CSV.foreach('csv/hs_contacts_updated.csv', :headers => true) do |row|
        
        CSV.foreach('csv/pharmerica.csv', headers: true, encoding:'iso-8859-1:utf-8') do |row|
           
        # CSV.foreach('csv/hs_contacts.csv', :headers => true) do |row|
            
           name = row[0]
           address = row[1]
           city = row[2]
           state = row[3]
           zip = row[4]        

            
            c = PharmericaPharmacy.new
              c.name=name 
              c.address=address 
              c.city=city
              c.state=state
              c.zip=zip     
            c.save
       
        end
      end
    end
  end