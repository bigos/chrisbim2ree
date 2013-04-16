require 'spec_helper'

describe ContactMessage do
  it "has a valid factory" do
    msg = FactoryGirl.create(:contact_message)
    msg.should be_valid
  end
  it "is invalid without from" do 
    FactoryGirl.build(:contact_message, from: nil).should_not be_valid
  end
  it "is invalid with invalid email address" do 
    FactoryGirl.build(:contact_message, from: 'lorem ipsum').should_not be_valid
  end
  it "is invalid without subject" do 
    FactoryGirl.build(:contact_message, subject: nil).should_not be_valid
  end
  it "is invalid without message" do 
    FactoryGirl.build(:contact_message, message: nil).should_not be_valid
  end
end
