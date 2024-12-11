namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task tte_servicing_pharmacies: :environment do
          CSV.foreach("csv/tte_pharmacies.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|           
           
           state = State.find_by_iso(row[5])

           puts state.name

           p = TteServicingPharmacy.new
            p.name=row[0]
            p.pharmid=row[1]
            p.street1=row[2]
            p.street2=row[3]
            p.city=row[4]
            p.state_id=state.id
            p.zip=row[6]
            p.phone=row[7]
          p.save
         
         end
       end
     end
  end