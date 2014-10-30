require "spec_helper"

feature "Categories Pages" do 
	let(:user) { OrganizationUser.first }
	background { sign_in user }
	subject { page }

	feature "Agency Categories" do
		given(:category) { AgencyCategorty.create(name: "Test Category", owner_id: 1, 
																					owner_type: "Organization") }
	
		feature "visiting agencies index page" do
			background { visit agency_categories_path }

			scenario { should have_content "New Root Category" }
			scenario { should have_content "New Root Agency" }

			feature "Adding a new root agency category" do
				background do
					click_link "New Root Category"
					fill_in "Name", with: "New Root"
					click_button "Create Agency category"
				end

				scenario { should have_content "New Root Category" }
				scenario { should have_content "Edit" }
				scenario { should have_content "Delete" }
				scenario { should have_content "Create New Child" }

				feature "add a child to the root" do
					background do
						click_link "New Root"
						click_link "New Agency"
						fill_in "Name", with: "First Child"
						click_button "Create Agency"
					end

					scenario { should have_content "New Root one Agency" }

				end
			end
		end
	end
end