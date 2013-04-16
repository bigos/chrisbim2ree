require 'spec_helper'

describe "workshops/show" do
  before(:each) do
    @workshop = assign(:workshop, stub_model(Workshop,
      :duration => 1,
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
