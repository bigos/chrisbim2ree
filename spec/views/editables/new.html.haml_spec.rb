require 'spec_helper'

describe "editables/new" do
  before(:each) do
    assign(:editable, stub_model(Editable,
      :name => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new editable form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", editables_path, "post" do
      assert_select "input#editable_name[name=?]", "editable[name]"
      assert_select "textarea#editable_content[name=?]", "editable[content]"
    end
  end
end
