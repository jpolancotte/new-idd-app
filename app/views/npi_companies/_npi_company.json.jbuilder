json.extract! npi_company, :id, :name, :number, :enumeration_date, :last_updated, :subpart, :status, :created_at, :updated_at
json.url npi_company_url(npi_company, format: :json)
