namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task sites: :environment do
          CSV.foreach("csv/nc_sites.csv", headers: true, :encoding => 'windows-1251:utf-8', header_converters: :symbol, converters: :all) do |row|           
           
          organization=Organization.find_or_create_by(name: row[1])
          puts organization
           
          name = row[0]
          organization_id=organization.id
          address=row[2]
          city=row[3]
          state=row[4]
          zip=row[5]
          county=row[6]
          beds=row[7]
          category=row[8]
          service_type=row[9]
          total_bed_count=row[10]
          total_resident_count=row[11]
          icf_idd=row[12]
          license_number=row[13]

          s = Site.new
           s.name=name
           s.organization_id=organization_id
           s.address=address
           s.city=city
           s.state=state
           s.zip=zip
           s.county=county
           s.beds=beds
           s.category=category
           s.service_type=service_type
           s.total_bed_count=total_bed_count
           s.total_resident_count
           s.icf_idd=icf_idd
           s.license_number=license_number
          s.save
         end
       end
     end
  end