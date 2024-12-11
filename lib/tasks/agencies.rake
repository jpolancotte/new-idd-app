namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task agencies: :environment do
          CSV.foreach("csv/mn_agencies.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|           
           
          state = State.find_by_iso(row[8])
          company=Company.find_by(name: row[3])
           
           a = Agency.new
            a.name=row[2]
            a.state_id=state.id
            a.company_id=company.id
            a.street1=row[4]
            a.street2=row[5]
            a.city=row[7]
            a.zip=row[9]
            a.license_number=row[0]
            a.license_type=row[1]
            a.county=row[10]
            a.phone=row[11]
            a.license_status=row[12]
            a.capacity=row[13]
            a.licensing_authority=row[17]

           a.save
         
         end
       end
     end
  end