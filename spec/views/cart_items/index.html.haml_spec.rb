require 'spec_helper'

describe "cart_items/index" do
  before(:each) do
    assign(:cart_items, [
      stub_model(CartItem,
        :shopping_cart_id => 1,
        :photo_id => 2,
        :quantity => 3,
        :price => "9.99",
        :option => "Option"
      ),
      stub_model(CartItem,
        :shopping_cart_id => 1,
        :photo_id => 2,
        :quantity => 3,
        :price => "9.99",
        :option => "Option"
      )
    ])
  end

  it "renders a list of cart_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Option".to_s, :count => 2
  end
end
