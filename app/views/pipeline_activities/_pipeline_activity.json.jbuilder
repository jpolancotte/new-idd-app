json.extract! pipeline_activity, :id, :end_date, :start_date, :week_number, :created_at, :updated_at
json.url pipeline_activity_url(pipeline_activity, format: :json)
