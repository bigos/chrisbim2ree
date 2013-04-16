require 'spec_helper'

describe "slides/show" do
  before(:each) do
    @slide = assign(:slide, stub_model(Slide,
      :caption => "Caption",
      :position => 1,
      :visible => false,
      :photo_file_name => "Photo File Name",
      :photo_content_type => "Photo Content Type",
      :photo_file_size => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Caption/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/Photo File Name/)
    rendered.should match(/Photo Content Type/)
    rendered.should match(/2/)
  end
end
