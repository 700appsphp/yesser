require 'spec_helper'

describe "Version 1 API pages" do
  let(:org) { FactoryGirl.create(:organization) }
  let(:second_org) { FactoryGirl.create(:organization) }
  let!(:agency1) { FactoryGirl.create(:agency, organization: org) }
  let!(:agency2) { FactoryGirl.create(:agency, organization: second_org) }

  describe "agencies" do
    let!(:agency_list) do
      FactoryGirl.create_list(:agency, 5, organization: org).reverse
    end
    before do
      FactoryGirl.create_list(:agency, 6, organization: second_org)
    end

    describe "index page" do
      it "should list all agencies of current organization only" do
        get "api/v1/organizations/#{org.id}/agencies"
        expect(response).to be_success
        expect(json.length).to eq(6)
        agencies = agency_list + [agency1]
        agencies.each_with_index do |agency, index|
          check_json(agency, json[index])
        end
      end
    end

    describe "show page" do
      it "should list all attributes of agency" do
        get "api/v1/organizations/#{org.id}/agencies/#{agency1.id}"
        expect(response).to be_success
        check_json(agency1, json)
      end
    end
  end

  describe "eservices" do
    let!(:organization_eservices) do
      FactoryGirl.create_list(:organization_eservice, 5, owner: org).reverse
    end
    let!(:agency_eservices) do
      FactoryGirl.create_list(:agency_eservice, 5, owner: agency1).reverse
    end
    before do
      FactoryGirl.create_list(:organization_eservice, 6, owner: second_org)
      FactoryGirl.create_list(:agency_eservice, 6, owner: agency2)
    end

    describe "index page" do
      it "should list all eservices of current organization and its agencies only" do
        get "api/v1/organizations/#{org.id}/eservices"
        expect(response).to be_success
        expect(json.length).to eq(10)
        eservices = agency_eservices + organization_eservices
        eservices.each_with_index do |eservice, index|
          check_json(eservice, json[index])
        end
      end
    end

    describe "show page" do
      let(:eservice1) { FactoryGirl.create(:organization_eservice, owner: org) }
      it "should lsit all attributes of eservice" do
        get api_v1_organization_eservice_path(organization_id: org.id,
                                              id: eservice1.id)
        expect(response).to be_success
        check_json(eservice1, json)
      end
    end
  end

  describe "agency catgories" do
    let!(:agency_categories) do
      FactoryGirl.create_list(:agency_category, 5, owner: org).reverse
    end
    before do
      FactoryGirl.create_list(:agency_category, 6, owner: second_org)
    end

    describe "index page" do
      it "should list all agency categories of current organization only" do
        get api_v1_organization_agency_categories_path(organization_id: org.id)
        expect(response).to be_success
        expect(json.length).to eq(5)
        agency_categories.each_with_index do |category, index|
          check_json(category, json[index])
        end
      end
    end

    describe "show page" do
    let(:agency_category) { FactoryGirl.create(:agency_category, owner: org) }
      it "should list all attributes of agency category" do
        get api_v1_organization_agency_category_path(organization_id: org.id,
                                                     id: agency_category.id)
        expect(response).to be_success
        check_json(agency_category, json)
      end
    end
  end

  describe "eservice catgories" do
    let!(:organization_eservice_category_list) do 
      FactoryGirl.create_list(:organization_eservice_category, 5, owner: org).reverse
    end
    let!(:agency_eservice_category_list) do
      FactoryGirl.create_list(:agency_eservice_category, 5, owner: org).reverse
    end
    before do
      FactoryGirl.create_list(:organization_eservice_category, 6, owner: second_org)
      FactoryGirl.create_list(:agency_eservice_category, 6, owner: second_org)
    end

    describe "index page" do
      it "should list all eservice categories of current organization only" do
        get api_v1_organization_eservice_categories_path(organization_id: org.id)
        expect(response).to be_success
        expect(json.length).to eq(10)
        categories = agency_eservice_category_list + organization_eservice_category_list
        categories.each_with_index do |category, index|
          check_json(category, json[index])
        end
      end
    end

    describe "show page" do
      let(:eservice_category) do
        FactoryGirl.create(:organization_eservice_category, owner: org)
      end
      it "should list all attributes of eservice category" do
        get api_v1_organization_eservice_category_path(organization_id: org.id,
                                                     id: eservice_category.id)
        expect(response).to be_success
        check_json(eservice_category, json)
      end
    end
  end
end