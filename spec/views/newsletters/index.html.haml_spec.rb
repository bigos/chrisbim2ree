require 'spec_helper'

describe "newsletters/index" do
  before(:each) do
    assign(:newsletters, [
      stub_model(Newsletter,
        :subject => "Subject",
        :content => "MyText"
      ),
      stub_model(Newsletter,
        :subject => "Subject",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of newsletters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
