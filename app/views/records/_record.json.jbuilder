json.extract! record, :id, :title, :creator, :url, :created_at, :updated_at
json.url record_url(record, format: :json)
