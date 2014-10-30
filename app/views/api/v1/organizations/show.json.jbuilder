json.key_format! ->(key){ key.delete "?" }
json.extract! @organization, :id, :name, :address, :phones, :faxes, :emails, :social_networks, :allow_eservices?, :categorize_agencies?, :categorize_eservices?, :agencies_count, :eservices_count, :logo_thumb_url, :created_at, :updated_at
json.description @organization.description.to_s
json.longitude @organization.longitude.to_s
json.logo_url @organization.logo_url.to_s
json.logo_thumb_url @organization.logo_thumb_url.to_s
json.latitude @organization.latitude.to_s
json.address @organization.address.to_s
json.mission @organization.mission.to_s
json.vision @organization.vision.to_s
json.message @organization.message.to_s
json.website @organization.website.to_s
