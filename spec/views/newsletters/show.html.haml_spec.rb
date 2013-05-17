require 'spec_helper'

describe "newsletters/show" do
  before(:each) do
    @newsletter = assign(:newsletter, stub_model(Newsletter,
      :subject => "Subject",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
  end
end
