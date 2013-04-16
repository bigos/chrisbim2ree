class Workshop < ActiveRecord::Base
  attr_accessible :content, :title, :duration, :start_date
  validates_presence_of  :content, :title, :duration, :start_date
  
  DURATION_OPTIONS = {'weekend' => 2, '3 day' => 3, '5 day'=> 5}
  validates :duration, :inclusion => { :in => DURATION_OPTIONS.values, :message => "%{value} is not a valid workshop duration" }

  def date_range
    finish = self.start_date + (self.duration.days-1)
    ord_start  = self.start_date.day.ordinalize
    ord_finish = finish.day.ordinalize
    "#{ord_start} #{self.start_date.strftime(" %b")} to #{ord_finish} #{finish.strftime("%b/%Y")}"    
  end
  
end
