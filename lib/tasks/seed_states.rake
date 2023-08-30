namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task states: :environment do
          CSV.foreach("csv/states.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|           
           name = row[0]
           iso = row[1]
           s = State.find_or_create_by(name: name, iso: iso)
           s.save
         end
       end
     end
  end