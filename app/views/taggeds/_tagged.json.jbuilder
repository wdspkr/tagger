json.extract! tagged, :id, :title, :creator, :url, :created_at, :updated_at
json.url tagged_url(tagged, format: :json)
