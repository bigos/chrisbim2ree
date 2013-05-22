require 'spec_helper'

describe NewsletterUnsubscribeController do

  describe "GET 'unsubscribe'" do
    it "returns http success" do
      get 'unsubscribe'
      response.should be_success
    end
  end

end
