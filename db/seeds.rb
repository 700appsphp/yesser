# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
org = Organization.create!(name: "Education")
org_admin = org.organization_users.create(email: "user@example.com", 
										  password: "password",
									      password_confirmation: "password")

org_user = OrganizationUser.create(email: "user@example.com", password: "password",
								   password_confirmation: "password")
admin = AdminUser.create(email: "admin@example.com", password: "password",
								   password_confirmation: "password")

# Create some categories for agencies and eservices
5.times do |n|
	agency_root = AgencyCategory.create!(name: "Root#{n}", owner: org)
	eservice_root = EserviceCategory.create!(name: "Root#{n}", owner: org)
	3.times do |i|
		Agency.create(name: "Agency#{i} of Root#{n}", organization: org, category: agency_root)
		Eservice.create(name: "Eservice#{i} of Root#{n}", owner: org, category: eservice_root)
		child_agency_category = AgencyCategory.create(name: "Child#{i} of Root#{n}", 
																									owner: org, parent: agency_root)
		child_eservice_category = EserviceCategory.create(name: "Child#{i} of Root#{n}", 
																											owner: org, parent: eservice_root)
		Agency.create(name: "Agency of Child#{i} of Root#{n}", 
									organization: org, category: child_agency_category)
		Eservice.create(name: "Eservice of Child#{i} of Root#{n}",
										owner: org, category: child_eservice_category)
	end
end
