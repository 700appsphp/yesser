json.key_format! ->(key){ key.delete "?" }
json.extract! @agency, :id, :name, :description, :organization_id, :longitude, :latitude, :address, :logo_url, :website, :phones, :faxes, :emails, :allow_eservices?, :categorize_eservices?, :eservices_count, :city_id, :created_at, :updated_at, :logo_thumb_url
json.category_id fq_rescue_nil(@agency.category_id)
json.get_root_category_id fq_rescue_nil(@agency.get_root_category_id)
