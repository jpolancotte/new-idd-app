namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task tte_clients: :environment do
          CSV.foreach("csv/tte_clients.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|           
           
           state = State.find_by_iso(row[6])
           pharm=TteServicingPharmacy.find_by(pharmid: row[0])
          #  puts pharm.pharmid

          #  puts state.name

           c = Client.new
            c.name=row[2]
            c.tte_servicing_pharmacy_id=pharm.id
            c.facid=row[1]
            c.street1=row[3]
            c.street2=row[4]
            c.city=row[5]
            c.state_id=state.id
            c.zip=row[7]
            c.admin_phone=row[8]
           c.save
         
         end
       end
     end
  end