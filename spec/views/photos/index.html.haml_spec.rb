require 'spec_helper'

describe "photos/index" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :attachment_file_name => "Attachment File Name",
        :attachment_content_type => "Attachment Content Type",
        :attachment_file_size => 1
      ),
      stub_model(Photo,
        :attachment_file_name => "Attachment File Name",
        :attachment_content_type => "Attachment Content Type",
        :attachment_file_size => 1
      )
    ])
  end

  it "renders a list of photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Attachment File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Attachment Content Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
