json.extract! @eservice, :id, :name, :description, :url, :owner_id, :owner_type, :created_at, :updated_at, :logo_url, :get_root_category_id, :logo_thumb_url
json.category_id fq_rescue_nil(@eservice.category_id)
