require 'rails_helper'

RSpec.describe "pdfs/edit", :type => :view do
  before(:each) do
    @pdf = assign(:pdf, Pdf.create!(
      :title => "MyString",
      :pdf_attachment => ""
    ))
  end

  it "renders the edit pdf form" do
    render

    assert_select "form[action=?][method=?]", pdf_path(@pdf), "post" do

      assert_select "input#pdf_title[name=?]", "pdf[title]"

      assert_select "input#pdf_pdf_attachment[name=?]", "pdf[pdf_attachment]"
    end
  end
end
