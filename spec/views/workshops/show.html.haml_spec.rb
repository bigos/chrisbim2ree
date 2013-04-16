require 'spec_helper'

describe "workshops/show" do
  before(:each) do
    @workshop = assign(:workshop, stub_model(Workshop,
      :type => "Type",
      :title => "Title",
      :teaser => "Teaser",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    rendered.should match(/Title/)
    rendered.should match(/Teaser/)
    rendered.should match(/MyText/)
  end
end
