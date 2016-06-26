require 'rails_helper'

RSpec.describe "pdfs/show", :type => :view do
  before(:each) do
    @pdf = assign(:pdf, Pdf.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
