require "spec_helper"

describe EservicesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/eservices").to route_to("eservices#index")
    end

    it "routes to #new" do
      expect(:get => "/eservices/new").to route_to("eservices#new")
    end

    it "routes to #show" do
      expect(:get => "/eservices/1").to route_to("eservices#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/eservices/1/edit").to route_to("eservices#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/eservices").to route_to("eservices#create")
    end

    it "routes to #update" do
      expect(:put => "/eservices/1").to route_to("eservices#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/eservices/1").to route_to("eservices#destroy", :id => "1")
    end

  end
end
