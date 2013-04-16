require 'spec_helper'

describe "tags/new" do
  before(:each) do
    assign(:tag, stub_model(Tag,
      :name => "MyString",
      :parent_id => 1,
      :photo_id => 1
    ).as_new_record)
  end

  it "renders new tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tags_path, "post" do
      assert_select "input#tag_name[name=?]", "tag[name]"
      assert_select "input#tag_parent_id[name=?]", "tag[parent_id]"
      assert_select "input#tag_photo_id[name=?]", "tag[photo_id]"
    end
  end
end
