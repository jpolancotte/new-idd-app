namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task npi_companies: :environment do    
            
            last_search=LastSearch.last
            
            # states=State.all.order(:id)
            states=State.where("id >= ?", last_search.state.id)
            keys = TaxonomyDescription.where("id >= ?", last_search.taxonomy_description.id)

            states.each do |state|
                keys.each do |key|
                    skip=0   
                    loop do 
                        url="https://npiregistry.cms.hhs.gov/api/?taxonomy_description=#{key.name}&state=#{state.iso}&limit=200&skip=#{skip}&pretty=on&version=2.1"
                    
                        uri = URI(url)
                        res = Net::HTTP.get_response(uri)
                        res.body if res.is_a?(Net::HTTPSuccess)
                    
                        parsed_json = JSON.parse(res.body)
                    
                        count = parsed_json["result_count"]
                        results = parsed_json["results"]

                        # puts results
                        results.each do |r|
                            c=NpiCompany.create
                                c.number=r["number"]
                                c.name=r["basic"]["organization_name"]
                                c.enumeration_date=r["basic"]["enumeration_date"]
                                c.last_updated=r["basic"]["last_updated"]
                                c.subpart=r["basic"]["organizational_subpart"]
                                c.status=r["basic"]["status"]
                                c.first_name=r["basic"]["authorized_official_first_name"]
                                c.last_name=r["basic"]["authorized_official_last_name"]
                                c.telephone_number=r["basic"]["authorized_official_telephone_number"]                            
                                c.position=r["basic"]["authorized_official_title_or_position"]
                                c.prefix=r["basic"]["authorized_official_name_prefix"]
                                c.suffix=r["basic"]["authorized_official_name_suffix"]
                            c.save

                            if r["taxonomies"]
                                r["taxonomies"].each do |t|
                                    tax=Taxonomy.find_or_create_by(name: t["desc"], code: t["code"])
                                        tax.group=t["taxonomy_group"]
                                    tax.save
                                    
                                    ct=CompanyTaxonomy.create
                                        ct.npi_company_id=c.id
                                        ct.taxonomy_id=tax.id
                                        ct.state_iso=t["state"]
                                        ct.license=t["license"]
                                        ct.primary=t["primary"]
                                    ct.save

                                end                                
                            end

                            if r["addresses"]
                                r["addresses"].each do |add|
                                    address=NpiAddress.new
                                        address.npi_company_id=c.id
                                        address.address_purpose=add["address_purpose"]
                                        address.address=add["address_1"]
                                        address.city=add["city"]
                                        if State.exists?(iso: add["state"])
                                         address.state_id=State.find_by_iso(add["state"]).id
                                        else
                                         address.state_id=State.find_by_iso("Other").id
                                        end
                                        address.postal_code=add["postal_code"]
                                        address.telephone_number=add["telephone_number"]
                                    address.save

                                    ls=LastSearch.last
                                        #state must exists avoids nill or other
                                        if State.exists?(iso: add["state"])
                                            ls.state_id= State.find_by_iso(add["state"]).id
                                            ls.taxonomy_description_id=key.id
                                            ls.skip=skip
                                        else
                                            ls.state_id= State.find_by_iso("Other").id
                                            ls.taxonomy_description_id=key.id
                                            ls.skip=skip
                                        end  
                                    ls.save

                                end
                            end

                            if r["identifiers"] 
                                r["identifiers"].each do |dent|                                                              

                                    b=Identifier.create
                                        b.code = dent["code"]
                                        b.desc = dent["desc"]
                                        b.issuer = dent["issuer"]
                                        b.number = dent["identifier"]                                    
                                        b.npi_company_id=c.id
                                        b.state = dent["state"]
                                    b.save                                  

                                end                           
                            end                           

                        end #results.each do |r|
                        puts key.name   
                        puts state.iso                 
                        puts count  
                    
                        break if count == 0 || skip > 1000                    
                        skip += 200  

                    end #loop do 
                end #keys.each do |key|
            end #states.each do |state|          
         
       end
     end
  end