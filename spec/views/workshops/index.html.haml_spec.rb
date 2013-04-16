require 'spec_helper'

describe "workshops/index" do
  before(:each) do
    assign(:workshops, [
      stub_model(Workshop,
        :type => "Type",
        :title => "Title",
        :teaser => "Teaser",
        :content => "MyText"
      ),
      stub_model(Workshop,
        :type => "Type",
        :title => "Title",
        :teaser => "Teaser",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of workshops" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Teaser".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
