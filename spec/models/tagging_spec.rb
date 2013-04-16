require 'spec_helper'
require 'factory_girl'

describe Tagging do
  it "has a valid factory" do
    tag = FactoryGirl.create(:tag)
    tag.should be_valid
  end
  it "is invalid with no name" do
    FactoryGirl.build(:tag, name: nil).should_not be_valid
  end
  it "shold not let me to have two tags with the same name" do
    name = 'new name'
    FactoryGirl.create(:tag, name: name)
    FactoryGirl.build(:tag, name: name).should_not be_valid
  end
end
