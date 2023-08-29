json.extract! document, :id, :description, :link, :key, :created_at, :updated_at
json.url document_url(document, format: :json)
