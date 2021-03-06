require "spec_helper"

describe NewsletterSubscribersController do
  describe "routing" do

    it "routes to #index" do
      get("/newsletter_subscribers").should route_to("newsletter_subscribers#index")
    end

    it "routes to #new" do
      get("/newsletter_subscribers/new").should route_to("newsletter_subscribers#new")
    end

    it "routes to #show" do
      get("/newsletter_subscribers/1").should route_to("newsletter_subscribers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/newsletter_subscribers/1/edit").should route_to("newsletter_subscribers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/newsletter_subscribers").should route_to("newsletter_subscribers#create")
    end

    it "routes to #update" do
      put("/newsletter_subscribers/1").should route_to("newsletter_subscribers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/newsletter_subscribers/1").should route_to("newsletter_subscribers#destroy", :id => "1")
    end

  end
end
