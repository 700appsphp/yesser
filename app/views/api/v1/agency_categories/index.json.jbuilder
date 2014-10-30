json.key_format! ->(key){ key.delete "?" }
json.array!(@agency_categories) do |agency_category|
  json.extract! agency_category, 
  :id, :name, :description, 
  :ancestry, :owner_id, :owner_type, :has_children?, :created_at, :updated_at
  json.parent_id fq_rescue_nil(agency_category.parent_id)
end
