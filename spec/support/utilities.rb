require 'spec_helper'

def sign_in(user=nil, options = {})
  unless user
    org = FactoryGirl.create(:organization)
    user = FactoryGirl.create(:organization_user, organization_id: org.id)
  end
  if options[:no_capybara]
    # Sign in when not using capybara
    ## SEARCH how to do that with devise
    remember_token = Organization_user.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, OrganizationUser.hash(remember_token))
  else
    visit new_organization_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end