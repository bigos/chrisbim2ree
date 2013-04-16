class Workshop < ActiveRecord::Base
  attr_accessible :content, :duration, :start_date, :title
end
