namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task tte_states: :environment do
          CSV.foreach("csv/tte_states.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|           
           name = row[0]           
           s = State.find_by_name(name)
           s.active = true
           s.save
         end
       end
     end
  end