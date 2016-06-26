class Pdf < ActiveRecord::Base
  attr_accessible :attachment_content_type, :attachment_file_name, :attachment_file_size, :attachment_updated_at, :attachment, :title

  has_attached_file :attachment
  include Rails.application.routes.url_helpers

  before_save :set_title

  def set_title
    self.title = self.attachment_file_name
  end
end
