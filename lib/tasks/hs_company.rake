namespace :db do
    namespace :seed do
      desc "Seed HS Companies data"
      task hs_companies: :environment do
        
        # CSV.foreach('csv/hs_contacts_updated.csv', :headers => true) do |row|
        
        CSV.foreach('csv/hs_companies.csv', headers: true, encoding:'iso-8859-1:utf-8') do |row|
           
        # CSV.foreach('csv/hs_contacts.csv', :headers => true) do |row|
            
           name = row["Name"]
           address = row["Address"]           
           city = row["City"]
           state= row["State"]
           zip = row["Zip"]           
           primary_identifier= row["Primary Identifier"]  
           hs_number = row["HS Number"]  
           website= row["Website"]      
            
            
            c = HsCompany.find_or_create_by(hs_number: hs_number)
              c.name=name if name              
              c.address=address if address
              c.city=city if city
              c.state=state if state
              c.zip=zip if zip              
              c.primary_identifier=primary_identifier if primary_identifier
              c.hs_number=hs_number if hs_number   
              c.website=website if website  

                
            c.save
       
        end
      end
    end
  end