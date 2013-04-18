require 'spec_helper'

describe "shopping_carts/new" do
  before(:each) do
    assign(:shopping_cart, stub_model(ShoppingCart,
      :customer_token => "MyString"
    ).as_new_record)
  end

  it "renders new shopping_cart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shopping_carts_path, "post" do
      assert_select "input#shopping_cart_customer_token[name=?]", "shopping_cart[customer_token]"
    end
  end
end
