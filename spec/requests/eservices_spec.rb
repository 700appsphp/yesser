require 'spec_helper'
load "#{Rails.root}/db/seeds.rb"

describe "Eservices" do
  before { sign_in }
  describe "adding an eservice with a non-leaf category" do
      let(:root_category) { EserviceCategory.find_by_name("Root0") }
      before do
        post '/eservices', eservice: {name: "Test Eservice", 
        category_id: root_category.id}
      end
      specify { expect(response).to redirect_to eservice_categories_path }
  end
end
