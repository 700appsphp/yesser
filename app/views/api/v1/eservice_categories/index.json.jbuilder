json.key_format! ->(key){ key.delete "?" }
json.array!(@eservice_categories) do |eservice_category|
  json.extract! eservice_category, 
  :id, :name, :description, 
  :ancestry, :owner_id, :owner_type, :has_children?, :created_at, :updated_at
    json.parent_id fq_rescue_nil(eservice_category.parent_id)
end
