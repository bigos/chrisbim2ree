require 'spec_helper'

describe Tag do
  it "has a valid factory" do
    tag = FactoryGirl.create(:tag)
    # p tag
    tag.should be_valid
  end
  it "is invalid with no name" do
    FactoryGirl.build(:tag, name: '').should_not be_valid
  end
  it "is invalid with name made of spaces" do
    FactoryGirl.build(:tag, name: '   ').should_not be_valid
  end
end
