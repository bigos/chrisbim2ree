require 'spec_helper'

describe "workshops/edit" do
  before(:each) do
    @workshop = assign(:workshop, stub_model(Workshop,
      :type => "",
      :title => "MyString",
      :teaser => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit workshop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", workshop_path(@workshop), "post" do
      assert_select "input#workshop_type[name=?]", "workshop[type]"
      assert_select "input#workshop_title[name=?]", "workshop[title]"
      assert_select "input#workshop_teaser[name=?]", "workshop[teaser]"
      assert_select "textarea#workshop_content[name=?]", "workshop[content]"
    end
  end
end
