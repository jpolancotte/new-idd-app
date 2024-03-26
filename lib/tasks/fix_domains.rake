namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task fix_domains: :environment do
            require 'adomain'

            CSV.open("csv/de_providers_results.csv", "a") do |fl|
                CSV.foreach("csv/de_providers.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|     
                    url=row[1]
                    domain = Adomain.domain url
                    fl << row.values_at(*row.headers) + [domain]
                end 
            end
       end
    end
end