class Tag < ActiveRecord::Base
  attr_accessible :name, :parent_id, :photo_id
end
