require 'rails_helper'

RSpec.describe "pdfs/index", :type => :view do
  before(:each) do
    assign(:pdfs, [
      Pdf.create!(),
      Pdf.create!()
    ])
  end

  it "renders a list of pdfs" do
    render
  end
end
