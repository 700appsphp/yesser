json.array!(@apps) do |app|
  json.extract! app, :id, :url, :platform, :created_at, :updated_at, :organization_id, :name
  json.image_url app.image_url.to_s
  json.description app.description.to_s
end
