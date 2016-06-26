class Pdf < ActiveRecord::Base
  attr_accessible :pdf_attachment, :title
  attr_accessible :pdf_attachment_content_type, :pdf_attachment_file_name, :pdf_attachment_file_size, :pdf_attachment_updated_at

  has_attached_file :pdf_attachment

  before_save :set_title

  def set_title
    self.title = self.pdf_attachment_file_name
  end
end
