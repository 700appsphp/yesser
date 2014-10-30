json.extract! @message, :id, :title, :description, :created_at, :updated_at
json.image_url @message.image_url.to_s
