require 'spec_helper'

describe Photo do
  it "has a valid fartory" do
    FactoryGirl.create(:photo).should be_valid
  end
end
