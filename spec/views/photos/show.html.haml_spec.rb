require 'spec_helper'

describe "photos/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :attachment_file_name => "Attachment File Name",
      :attachment_content_type => "Attachment Content Type",
      :attachment_file_size => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Attachment File Name/)
    rendered.should match(/Attachment Content Type/)
    rendered.should match(/1/)
  end
end
