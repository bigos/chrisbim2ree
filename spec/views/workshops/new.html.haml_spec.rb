require 'spec_helper'

describe "workshops/new" do
  before(:each) do
    assign(:workshop, stub_model(Workshop,
      :type => "",
      :title => "MyString",
      :teaser => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new workshop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", workshops_path, "post" do
      assert_select "input#workshop_type[name=?]", "workshop[type]"
      assert_select "input#workshop_title[name=?]", "workshop[title]"
      assert_select "input#workshop_teaser[name=?]", "workshop[teaser]"
      assert_select "textarea#workshop_content[name=?]", "workshop[content]"
    end
  end
end
