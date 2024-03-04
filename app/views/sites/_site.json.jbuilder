json.extract! site, :id, :name, :organization_id, :address, :city, :state, :zip, :county, :beds, :category, :service_type, :total_bed_count, :total_resident_count, :icf_idd, :license_number, :created_at, :updated_at
json.url site_url(site, format: :json)
