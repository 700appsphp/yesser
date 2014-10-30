require "spec_helper"

describe RssesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rsses").to route_to("rsses#index")
    end

    it "routes to #new" do
      expect(:get => "/rsses/new").to route_to("rsses#new")
    end

    it "routes to #show" do
      expect(:get => "/rsses/1").to route_to("rsses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rsses/1/edit").to route_to("rsses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rsses").to route_to("rsses#create")
    end

    it "routes to #update" do
      expect(:put => "/rsses/1").to route_to("rsses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rsses/1").to route_to("rsses#destroy", :id => "1")
    end

  end
end
