require 'spec_helper'

describe "workshops/index" do
  before(:each) do
    assign(:workshops, [
      stub_model(Workshop,
        :duration => 1,
        :title => "Title",
        :content => "MyText"
      ),
      stub_model(Workshop,
        :duration => 1,
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of workshops" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
