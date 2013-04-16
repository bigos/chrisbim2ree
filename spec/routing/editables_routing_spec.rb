require "spec_helper"

describe EditablesController do
  describe "routing" do

    it "routes to #index" do
      get("/editables").should route_to("editables#index")
    end

    it "routes to #new" do
      get("/editables/new").should route_to("editables#new")
    end

    it "routes to #show" do
      get("/editables/1").should route_to("editables#show", :id => "1")
    end

    it "routes to #edit" do
      get("/editables/1/edit").should route_to("editables#edit", :id => "1")
    end

    it "routes to #create" do
      post("/editables").should route_to("editables#create")
    end

    it "routes to #update" do
      put("/editables/1").should route_to("editables#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/editables/1").should route_to("editables#destroy", :id => "1")
    end

  end
end
