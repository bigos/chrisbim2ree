require 'spec_helper'

describe "newsletters/edit" do
  before(:each) do
    @newsletter = assign(:newsletter, stub_model(Newsletter,
      :subject => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit newsletter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newsletter_path(@newsletter), "post" do
      assert_select "input#newsletter_subject[name=?]", "newsletter[subject]"
      assert_select "textarea#newsletter_content[name=?]", "newsletter[content]"
    end
  end
end
