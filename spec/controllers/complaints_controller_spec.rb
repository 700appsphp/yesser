require 'spec_helper'

describe ComplaintsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'email_edit'" do
    it "returns http success" do
      get 'email_edit'
      expect(response).to be_success
    end
  end

  describe "GET 'email_update'" do
    it "returns http success" do
      get 'email_update'
      expect(response).to be_success
    end
  end

  describe "GET 'agency_edit'" do
    it "returns http success" do
      get 'agency_edit'
      expect(response).to be_success
    end
  end

  describe "GET 'agency_update'" do
    it "returns http success" do
      get 'agency_update'
      expect(response).to be_success
    end
  end

end
