json.key_format! ->(key){ key.delete "?" }
json.array!(@messages) do |message|
  json.extract! message, :id, :title, :description,:created_at, :updated_at
  json.image_url message.image_url.to_s
end
