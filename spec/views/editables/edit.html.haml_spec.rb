require 'spec_helper'

describe "editables/edit" do
  before(:each) do
    @editable = assign(:editable, stub_model(Editable,
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit editable form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", editable_path(@editable), "post" do
      assert_select "input#editable_name[name=?]", "editable[name]"
      assert_select "textarea#editable_content[name=?]", "editable[content]"
    end
  end
end
