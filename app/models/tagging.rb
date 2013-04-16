class Tagging < ActiveRecord::Base
  attr_accessible :photo_id, :tag_id
  belongs_to :photo
  belongs_to :tag
  validates_uniqueness_of :photo_id, :scope => [:tag_id]
end
