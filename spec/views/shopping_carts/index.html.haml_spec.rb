require 'spec_helper'

describe "shopping_carts/index" do
  before(:each) do
    assign(:shopping_carts, [
      stub_model(ShoppingCart,
        :customer_token => "Customer Token"
      ),
      stub_model(ShoppingCart,
        :customer_token => "Customer Token"
      )
    ])
  end

  it "renders a list of shopping_carts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Customer Token".to_s, :count => 2
  end
end
