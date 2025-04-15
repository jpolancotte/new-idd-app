namespace :db do
    namespace :seed do
      desc "Seed HS contact data"
      task hs_contacts: :environment do
        
        # CSV.foreach('csv/hs_contacts_updated.csv', :headers => true) do |row|
        
        CSV.foreach('csv/hs_contacts.csv', headers: true, encoding:'iso-8859-1:utf-8') do |row|
           
        # CSV.foreach('csv/hs_contacts.csv', :headers => true) do |row|
            
           first_name = row["First Name"]
           last_name = row["Last Name"]
           email = row["Email"]
           hs_number = row["HS Number"]
           job_title= row["Job Title"]
           phone=row["Phone"]
           address = row["Address"]
           city = row["City"]
           state= row["State"]
           zip_code= row["Zip Code"]
           company_type= row["Company Type"]
           company_name= row["Company Name"]
           primay_identifier= row["Primary Identifier"]
           
           contact_city= row["Contact City"]
           contact_state= row["Contact State"]
           cell_phone=row["Cell Number"]
          

        

           company_address= row["Company Address"]
           company_city= row["Company City"]
           company_state= row["Company State"]
           company_postal_code= row["Company Postal Code"]
            
            
            c = HsContact.find_or_create_by(hs_number: hs_number)
              c.first_name=first_name if first_name
              c.last_name=last_name if last_name
              c.email=email if email
              c.hs_number=hs_number
              c.address=address if address
              c.city=city if city
              c.state=state if state
              c.zip_code=zip_code if zip_code
              c.company_type=company_type if company_type
              c.company_name=company_name if company_name
              c.primay_identifier=primay_identifier if primay_identifier
              c.job_title=job_title if job_title
              c.contact_city=contact_city if contact_city
              c.contact_state=contact_state if contact_state
              c.cell_phone=cell_phone if cell_phone
              c.phone=phone if phone

            #   c.company_address=company_address if company_address
            #   c.company_city=company_city if company_city
            #   c.company_state=company_state if company_state
            #   c.company_postal_code=company_postal_code if company_postal_code
    
            c.save
       
        end
      end
    end
  end