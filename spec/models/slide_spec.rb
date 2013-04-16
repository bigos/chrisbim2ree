require 'spec_helper'

describe Slide do
  it "has valid factory" do 
    FactoryGirl.create(:slide).should be_valid
  end
  it "is invalid without caption" do
    FactoryGirl.build(:slide, caption: nil) .should_not be_valid
  end
end
