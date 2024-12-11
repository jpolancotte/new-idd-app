json.extract! client, :id, :name, :facid, :tte_servicing_pharmacy_id, :street1, :street2, :city, :state_id, :zip, :admin_phone, :created_at, :updated_at
json.url client_url(client, format: :json)
