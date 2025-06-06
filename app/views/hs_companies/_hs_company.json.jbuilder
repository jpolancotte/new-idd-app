json.extract! hs_company, :id, :name, :address, :city, :state, :zip, :primary_identifier, :hs_number, :website, :latitude, :longitude, :created_at, :updated_at
json.url hs_company_url(hs_company, format: :json)
