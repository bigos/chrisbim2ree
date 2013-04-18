require 'spec_helper'

describe "cart_items/show" do
  before(:each) do
    @cart_item = assign(:cart_item, stub_model(CartItem,
      :shopping_cart_id => 1,
      :photo_id => 2,
      :quantity => 3,
      :price => "9.99",
      :option => "Option"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/9.99/)
    rendered.should match(/Option/)
  end
end
