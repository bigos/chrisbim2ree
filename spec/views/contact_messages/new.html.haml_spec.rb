require 'spec_helper'

describe "contact_messages/new" do
  before(:each) do
    assign(:contact_message, stub_model(ContactMessage,
      :from => "MyString",
      :subject => "MyString",
      :message => "MyText"
    ).as_new_record)
  end

  it "renders new contact_message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_messages_path, "post" do
      assert_select "input#contact_message_from[name=?]", "contact_message[from]"
      assert_select "input#contact_message_subject[name=?]", "contact_message[subject]"
      assert_select "textarea#contact_message_message[name=?]", "contact_message[message]"
    end
  end
end
