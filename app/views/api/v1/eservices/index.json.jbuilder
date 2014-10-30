json.key_format! ->(key){ key.delete "?" }
json.array!(@eservices) do |eservices|
  json.extract! eservices, :id, :name, :description, :url, :owner_id, :owner_type, :created_at, :updated_at, :logo_url, :get_root_category_id, :logo_thumb_url
  json.category_id fq_rescue_nil(eservices.category_id)
  json.get_root_category_id fq_rescue_nil(eservices.get_root_category_id)
end
