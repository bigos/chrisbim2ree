require 'spec_helper'

describe "newsletter_subscribers/index" do
  before(:each) do
    assign(:newsletter_subscribers, [
      stub_model(NewsletterSubscriber,
        :email => "Email"
      ),
      stub_model(NewsletterSubscriber,
        :email => "Email"
      )
    ])
  end

  it "renders a list of newsletter_subscribers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
