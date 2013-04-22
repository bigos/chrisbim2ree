require 'spec_helper'

describe "newsletter_subscribers/show" do
  before(:each) do
    @newsletter_subscriber = assign(:newsletter_subscriber, stub_model(NewsletterSubscriber,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
