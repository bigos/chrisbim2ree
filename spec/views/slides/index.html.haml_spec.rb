require 'spec_helper'

describe "slides/index" do
  before(:each) do
    assign(:slides, [
      stub_model(Slide,
        :caption => "Caption",
        :position => 1,
        :visible => false,
        :photo_file_name => "Photo File Name",
        :photo_content_type => "Photo Content Type",
        :photo_file_size => 2
      ),
      stub_model(Slide,
        :caption => "Caption",
        :position => 1,
        :visible => false,
        :photo_file_name => "Photo File Name",
        :photo_content_type => "Photo Content Type",
        :photo_file_size => 2
      )
    ])
  end

  it "renders a list of slides" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Caption".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Photo File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Photo Content Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
