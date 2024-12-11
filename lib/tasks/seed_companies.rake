namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task companies: :environment do
          CSV.foreach("csv/mn_companies.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|           
           
           puts state = State.find_by_iso(row[1])
           
          #  puts pharm.pharmid

          #  puts state.name

           c = Company.new
            c.name=row[0]
            c.state_id=state.id
           c.save
         
         end
       end
     end
  end