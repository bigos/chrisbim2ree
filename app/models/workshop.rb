class Workshop < ActiveRecord::Base
  attr_accessible :content, :title, :duration, :start_date
  validates_presence_of  :content, :title, :duration, :start_date

  DURATION_OPTIONS = {'one day' =>1, 'weekend' => 2, '3 day' => 3, '4 day' => 4, '5 day'=> 5, '6 day' => 6}
  validates :duration, :inclusion => { :in => DURATION_OPTIONS.values, :message => "%{value} is not a valid workshop duration" }

  def self.duration_in_words(d)
    DURATION_OPTIONS.key(d)
  end

  def date_range
    finish = self.start_date + (self.duration.days-1)
    ord_start  = self.start_date.day.ordinalize
    ord_finish = finish.day.ordinalize
    "#{ord_start} #{self.start_date.strftime(" %B")} to #{ord_finish} #{finish.strftime("%B %Y")}"
  end

end
