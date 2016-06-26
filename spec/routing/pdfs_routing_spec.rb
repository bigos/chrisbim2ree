require "rails_helper"

RSpec.describe PdfsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pdfs").to route_to("pdfs#index")
    end

    it "routes to #new" do
      expect(:get => "/pdfs/new").to route_to("pdfs#new")
    end

    it "routes to #show" do
      expect(:get => "/pdfs/1").to route_to("pdfs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pdfs/1/edit").to route_to("pdfs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pdfs").to route_to("pdfs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pdfs/1").to route_to("pdfs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pdfs/1").to route_to("pdfs#destroy", :id => "1")
    end

  end
end
