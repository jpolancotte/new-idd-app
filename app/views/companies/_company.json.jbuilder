json.extract! company, :id, :name, :state_id, :street1, :street2, :city, :zip, :website, :phone, :created_at, :updated_at
json.url company_url(company, format: :json)
