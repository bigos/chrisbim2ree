require 'spec_helper'

describe Editable do
  it "has a valid fartory" do
    FactoryGirl.create(:editable).should be_valid
  end
  it "is invalid without name" do
    FactoryGirl.build(:editable, name: nil).should_not be_valid
  end
  it "is invalid with name made of spaces" do
    FactoryGirl.build(:editable, name: '   ').should_not be_valid
  end
  it "is invalid without content" do
    FactoryGirl.build(:editable, content: nil).should_not be_valid
  end
  it "is invalid with content made of spaces" do
    FactoryGirl.build(:editable, content: '   ').should_not be_valid
  end
end
