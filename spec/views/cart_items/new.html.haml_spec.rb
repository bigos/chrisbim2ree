require 'spec_helper'

describe "cart_items/new" do
  before(:each) do
    assign(:cart_item, stub_model(CartItem,
      :shopping_cart_id => 1,
      :photo_id => 1,
      :quantity => 1,
      :price => "9.99",
      :option => "MyString"
    ).as_new_record)
  end

  it "renders new cart_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cart_items_path, "post" do
      assert_select "input#cart_item_shopping_cart_id[name=?]", "cart_item[shopping_cart_id]"
      assert_select "input#cart_item_photo_id[name=?]", "cart_item[photo_id]"
      assert_select "input#cart_item_quantity[name=?]", "cart_item[quantity]"
      assert_select "input#cart_item_price[name=?]", "cart_item[price]"
      assert_select "input#cart_item_option[name=?]", "cart_item[option]"
    end
  end
end
