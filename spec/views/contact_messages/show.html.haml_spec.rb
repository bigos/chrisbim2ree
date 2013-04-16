require 'spec_helper'

describe "contact_messages/show" do
  before(:each) do
    @contact_message = assign(:contact_message, stub_model(ContactMessage,
      :from => "From",
      :subject => "Subject",
      :message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/From/)
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
  end
end
