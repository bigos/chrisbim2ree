require "spec_helper"

describe ContactMessagesController do
  describe "routing" do

    it "routes to #index" do
      get("/contact_messages").should route_to("contact_messages#index")
    end

    it "routes to #new" do
      get("/contact_messages/new").should route_to("contact_messages#new")
    end

    it "routes to #show" do
      get("/contact_messages/1").should route_to("contact_messages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contact_messages/1/edit").should route_to("contact_messages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contact_messages").should route_to("contact_messages#create")
    end

    it "routes to #update" do
      put("/contact_messages/1").should route_to("contact_messages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contact_messages/1").should route_to("contact_messages#destroy", :id => "1")
    end

  end
end
