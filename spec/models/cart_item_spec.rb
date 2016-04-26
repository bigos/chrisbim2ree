require 'spec_helper'

describe CartItem do
  it "has a valid fartory" do
    FactoryGirl.create(:cart_item).should be_valid
  end
  it "missing shopping_cart_id should not be valid" do
    FactoryGirl.build(:cart_item, :shopping_cart_id => nil).should_not be_valid
  end
  it "missing photo_id should not be valid" do
    FactoryGirl.build(:cart_item, :photo_id => nil).should_not be_valid
  end


  it "missing quantity should not be valid" do
    FactoryGirl.build(:cart_item, :quantity => nil).should_not be_valid
  end
  it "zero quantity should not be valid" do
    FactoryGirl.build(:cart_item, :quantity => 0).should_not be_valid
  end
  it "fractional quantity should not be valid" do
    FactoryGirl.build(:cart_item, :quantity => 0.75).should_not be_valid
  end
  it "negative quantity should not be valid" do
    FactoryGirl.build(:cart_item, :quantity => (-1)).should_not be_valid
  end
  it "word quantity should not be valid" do
    FactoryGirl.build(:cart_item, :quantity => 'nothing').should_not be_valid
  end
end
