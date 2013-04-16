require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :attachment_file_name => "MyString",
      :attachment_content_type => "MyString",
      :attachment_file_size => 1
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photos_path, "post" do
      assert_select "input#photo_attachment_file_name[name=?]", "photo[attachment_file_name]"
      assert_select "input#photo_attachment_content_type[name=?]", "photo[attachment_content_type]"
      assert_select "input#photo_attachment_file_size[name=?]", "photo[attachment_file_size]"
    end
  end
end
