require 'spec_helper'

describe "newsletter_subscribers/new" do
  before(:each) do
    assign(:newsletter_subscriber, stub_model(NewsletterSubscriber,
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new newsletter_subscriber form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", newsletter_subscribers_path, "post" do
      assert_select "input#newsletter_subscriber_email[name=?]", "newsletter_subscriber[email]"
    end
  end
end
