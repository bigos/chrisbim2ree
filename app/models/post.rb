class Post < ActiveRecord::Base
  attr_accessible :content, :title, :teaser
  has_many :comments, :inverse_of => :post

  validates_presence_of :title, :content, :teaser

  accepts_nested_attributes_for :comments
end
