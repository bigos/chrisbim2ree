require 'rails_helper'

RSpec.describe "pdfs/edit", :type => :view do
  before(:each) do
    @pdf = assign(:pdf, Pdf.create!())
  end

  it "renders the edit pdf form" do
    render

    assert_select "form[action=?][method=?]", pdf_path(@pdf), "post" do
    end
  end
end
