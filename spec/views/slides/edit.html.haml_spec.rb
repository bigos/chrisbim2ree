require 'spec_helper'

describe "slides/edit" do
  before(:each) do
    @slide = assign(:slide, stub_model(Slide,
      :caption => "MyString",
      :position => 1,
      :visible => false,
      :photo_file_name => "MyString",
      :photo_content_type => "MyString",
      :photo_file_size => 1
    ))
  end

  it "renders the edit slide form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", slide_path(@slide), "post" do
      assert_select "input#slide_caption[name=?]", "slide[caption]"
      assert_select "input#slide_position[name=?]", "slide[position]"
      assert_select "input#slide_visible[name=?]", "slide[visible]"
      assert_select "input#slide_photo_file_name[name=?]", "slide[photo_file_name]"
      assert_select "input#slide_photo_content_type[name=?]", "slide[photo_content_type]"
      assert_select "input#slide_photo_file_size[name=?]", "slide[photo_file_size]"
    end
  end
end
