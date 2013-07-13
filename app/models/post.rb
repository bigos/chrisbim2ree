class Post < ActiveRecord::Base
  attr_accessible :content, :title, :teaser
  has_many :comments

  validates_presence_of :title, :content, :teaser

  accepts_nested_attributes_for :comments
end
