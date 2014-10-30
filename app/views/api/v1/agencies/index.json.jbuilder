json.key_format! ->(key){ key.delete "?" }
json.array!(@agencies) do |agency|
  json.extract! agency, :id, :name, :organization_id, :longitude, :latitude, :address, :logo_url, :website, :phones, :faxes, :emails, :allow_eservices?, :categorize_eservices?, :eservices_count, :city_id, :created_at, :updated_at, :logo_thumb_url
  json.category_id fq_rescue_nil(agency.category_id)
  json.get_root_category_id fq_rescue_nil(agency.get_root_category_id)
  json.description agency.description.to_s
  json.logo_url agency.logo_url.to_s
end
