namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task hs_mn_companies: :environment do
          CSV.foreach("csv/hs_mn_companies.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|           
            
          company = Company.find_by_name(row[0])
          # company.hubspot_number = row[1]
          # company.save

          if company
            # company = Company.find_by_name(row[0])
            company.hubspot_number = row[1]
            company.save

          end

         

         end
       end
     end
  end