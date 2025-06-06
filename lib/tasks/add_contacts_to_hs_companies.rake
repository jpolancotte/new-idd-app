namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task add_contacts: :environment do            

           
                CSV.foreach("csv/contacts.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
                    hs_number=row[0]
                    contacts=row[1]

                    # puts hs_number
                    # puts contacts

                    a=HsCompany.find_by_hs_number(hs_number)
                    if a
                    a.contacts=contacts
                    a.save
                    end
                    
                end 
           
       end
   
    end
end