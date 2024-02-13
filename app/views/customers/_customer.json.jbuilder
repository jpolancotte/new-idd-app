json.extract! customer, :id, :name, :facid, :pharmid, :address, :city, :state, :zip, :fac_admin_phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
