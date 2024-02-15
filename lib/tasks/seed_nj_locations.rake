namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task nj_locations: :environment do
          CSV.foreach("csv/njorglocations.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|           
            
           name = row[0]
           organization_id = Organization.find_by_name(name).id

           add=row[1]
           city=row[2]
           state_id = State.find_by_iso(row[3]).id
           zip=row[4]
           county=row[5]
           email=row[6]
           phone=row[7]

           loc=Location.new
            loc.organization_id=organization_id
            loc.name=name
            loc.address=add
            loc.city=city
            loc.state_id=state_id
            loc.zip=zip
            loc.county=county
            loc.email=email
            loc.phone=phone
           loc.save

         end
       end
     end
  end