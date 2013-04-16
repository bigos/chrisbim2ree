class Editable < ActiveRecord::Base
  attr_accessible :content, :name
  validates_presence_of :name, :content
end
