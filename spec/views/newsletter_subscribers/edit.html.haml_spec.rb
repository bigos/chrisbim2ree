require 'spec_helper'

describe "newsletter_subscribers/edit" do
  before(:each) do
    @newsletter_subscriber = assign(:newsletter_subscriber, stub_model(NewsletterSubscriber,
      :email => "MyString"
    ))
  end

  it "renders the edit newsletter_subscriber form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newsletter_subscriber_path(@newsletter_subscriber), "post" do
      assert_select "input#newsletter_subscriber_email[name=?]", "newsletter_subscriber[email]"
    end
  end
end
