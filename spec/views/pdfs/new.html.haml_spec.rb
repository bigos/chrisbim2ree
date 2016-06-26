require 'rails_helper'

RSpec.describe "pdfs/new", :type => :view do
  before(:each) do
    assign(:pdf, Pdf.new())
  end

  it "renders new pdf form" do
    render

    assert_select "form[action=?][method=?]", pdfs_path, "post" do
    end
  end
end
