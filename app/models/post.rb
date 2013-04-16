class Post < ActiveRecord::Base
  attr_accessible :content, :teaser, :title
end
