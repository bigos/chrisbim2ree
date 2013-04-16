class Slide < ActiveRecord::Base
  attr_accessible :caption, :photo_content_type, :photo_file_name, :photo_file_size, :photo_updated_at, :position, :visible
end
