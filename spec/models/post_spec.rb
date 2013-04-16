require 'spec_helper'

describe Post do
  it "has valid factory" do 
    FactoryGirl.create(:post).should be_valid
  end
  it "is invalid without title" do
    FactoryGirl.build(:post, title: nil) .should_not be_valid
  end
  it "is invalid without content" do
    FactoryGirl.build(:post, content: nil) .should_not be_valid
  end
  it "is invalid without teaser" do
    FactoryGirl.build(:post, teaser: nil) .should_not be_valid
  end
end
