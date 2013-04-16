require 'spec_helper'
require 'factory_girl'

describe Workshop do
  it "has a valid factory" do
    workshop = FactoryGirl.create(:workshop)
    workshop.should be_valid
  end
  it "is invalid without a duration" do
    FactoryGirl.build(:workshop, duration: nil).should_not be_valid
  end
  it "is invalid without a title" do
    FactoryGirl.build(:workshop, title: nil).should_not be_valid
  end
  it "is invalid without a teaser" do
    FactoryGirl.build(:workshop, teaser: nil).should_not be_valid
  end
  it "is invalid without a title" do
    FactoryGirl.build(:workshop, teaser: nil).should_not be_valid
  end

  it "is invalid with wrong duration" do
    FactoryGirl.build(:workshop, duration: 'weekend').should_not be_valid
  end
  it "is valid with duration - weekend" do
    FactoryGirl.build(:workshop, duration: 2).should be_valid
  end
  it "is valid with duration - 3 day" do
    FactoryGirl.build(:workshop, duration: 3).should be_valid
  end
  it "is valid with duration - 5 day" do
    FactoryGirl.build(:workshop, duration: 5).should be_valid
  end
end
